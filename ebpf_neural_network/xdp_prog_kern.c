
/* SPDX-License-Identifier: GPL-2.0 */
#include <linux/bpf.h>
#include <bpf/bpf_helpers.h>
#include <bpf/bpf_endian.h>
#include <linux/icmp.h>
#include "neural_network_fix.h"

#include "../common/xdp_stats_kern_user.h"
#include "../common/xdp_stats_kern.h"
#include "parsing_helpers.h"

//map for counting the types of packets
struct bpf_map_def SEC("maps") ip_map = {
	.type = BPF_MAP_TYPE_HASH,
	.key_size = sizeof(unsigned char), //the key is the last byte of the IPv6 address
	.value_size = sizeof(int[4]),
	.max_entries = 1024,
};

//map used for time checking
struct bpf_map_def SEC("maps") time_map = { // key 0 -> time passed since the last execution of the neural network; key  1 -> time used for parsing, key 2 -> time used for the neural network
	.type = BPF_MAP_TYPE_HASH,
	.key_size = sizeof(int),
	.value_size = sizeof(long long int),
	.max_entries = 1024,
};


static const unsigned char ultByte[12] = {0x02, 0x06, 0x0c, 0x09, 0x05, 0x0a, 0x01, 0x08, 0x07, 0x03, 0x0b, 0x04}; //last bytes of the Ipv6 of our dataset

SEC("xdp_packet_parser") //
int  xdp_parser_func(struct xdp_md *ctx)
{

	/*Starting header parsing*/
	long long int start_time_parser = bpf_ktime_get_ns(); // get time

	/*For each packet*/
	void *data_end = (void *)(long)ctx->data_end;
	void *data = (void *)(long)ctx->data;
	struct ethhdr *eth;
	struct hdr_cursor nh;
	int eth_type;

	nh.pos = data; 

	/*Parsing the first ethhdr header*/
	eth_type = parse_ethhdr(&nh, data_end, &eth); 
	if (eth_type < 0){
		return XDP_DROP;
	}

	if (eth_type == bpf_htons(ETH_P_IP)){


		/*The original pcap*/ 
		int size = (data_end - data) - sizeof(struct ethhdr); //original paccket size

		unsigned char * ipv6 = NULL;
		unsigned char * type = NULL;
		unsigned char * lastbyte = NULL;

		/*There are 4 different types of packet*/

		if (size == 64){  //raw IPv6  - type DIS: Information Solicitation - code 0

			/*Getting the IPv6*/

			if (nh.pos + 24> data_end) // 16 bytes till the IPv6 header and 8 bytes till the IPv6 address
				return XDP_PASS;
			nh.pos += 24;

			ipv6 = nh.pos; 

			if (ipv6 + 16 > data_end) //boundary checks
				return XDP_DROP;

			//16 bytes of the IPv6 address + 16 bytes of the rest of the IPv6 header -> you arrive to the next header
			//The type of the packet is on the second byte
	
			/*Getting the type of packet*/
			if (nh.pos + 33> data_end) 
				return XDP_DROP;
			nh.pos += 33;
		
			type = (unsigned char *)nh.pos;

			if (type + 1> data_end)
				return XDP_DROP;	

		}
		else if (size == 97){ //the IPv6 appears without prefix and without the last byte - DIO type: Information Object - code 1 
			
			/*Getting the last byte of the IPv6*/
			if (nh.pos + 7> data_end)
				return XDP_DROP;

			lastbyte = (unsigned char *)nh.pos+7; //the last byte is in an offset of 7 
			if (lastbyte + 1> data_end)
				return XDP_DROP;
			
			/*Getting the type of the packet*/

			if (nh.pos + 20> data_end)
				return XDP_DROP;

			type = (unsigned char *)nh.pos +20;

			if (type + 1> data_end)
				return XDP_DROP;

			/*Chasing for the IPv6*/

			if (nh.pos + 31 > data_end)
				return XDP_DROP;
			nh.pos += 31;

			ipv6 = nh.pos; //saco la IP

			if (ipv6 + 16 > data_end)
				return XDP_DROP;

			//Modifying the IPv6
			ipv6[0] = 0xfe;
    		ipv6[1] = 0x80;
			ipv6[15] = lastbyte[0];		
		
		}

		else if (size == 102){ //the IPv6 appears without the prefix and the last byte -- the code is 1 -- the code is in an offset of 25
			
			/*Getting the last byte of the IPv6*/
			if (nh.pos + 13> data_end)
				return XDP_DROP;

			lastbyte = (unsigned char *)nh.pos+13; //the last byte of the IPv6 is in an offset of 13

			if (lastbyte + 1> data_end)
				return XDP_DROP;

			/*Getting the type of packet*/
			if (nh.pos + 25> data_end)
				return XDP_DROP;

			type = (unsigned char *)nh.pos +25;

			if (type + 1> data_end)
				return XDP_DROP;

			/*Getting the rest of the IP*/
			if (nh.pos + 36 > data_end) 
				return XDP_DROP;
			nh.pos += 36;

			ipv6 = nh.pos; 

			if (ipv6 + 16 > data_end)
				return XDP_DROP;

			ipv6[0] = 0xfe;
    		ipv6[1] = 0x80;
			ipv6[15] = lastbyte[0];
		}
		else if (size == 76){ //the IPv6 appears without the prefix -- Packet type: DAO advertisment object - code 2 -- offset of 25

			/*getting the type of packet*/
			if (nh.pos + 25> data_end)
				return XDP_DROP;

			type = (unsigned char *)nh.pos +25;

			if (type + 1> data_end)
				return XDP_DROP;
			
			/*getting the rest of the ip*/
			if (nh.pos + 52 > data_end) 
				return XDP_DROP;
			nh.pos += 52;

			ipv6 = nh.pos;

			if (ipv6 + 16 > data_end)
				return XDP_DROP;

			ipv6[0] = 0xfe;
    		ipv6[1] = 0x80;
		}
		else{
			return XDP_DROP;
		}

		/*Updating the count of the packets*/
		int code = (int)type[0];

		int * count = bpf_map_lookup_elem(&ip_map, ipv6 + 15); //the key of the map is the last byte of the IPv6
		
		/*If the count does not exists, it is set to 0*/
		if (count == NULL){ 
			int * initial_count = (int *)(int []){0,0,0, 0};
			if ((code >= 0)&&(code <=3))
				initial_count[code]++;
			bpf_map_update_elem(&ip_map, ipv6 + 15, initial_count, BPF_ANY);
			return XDP_DROP;
		}

		if ((code >= 0)&&(code <=2)) //updating the count of packets
			count[code]++;
		
		bpf_map_update_elem(&ip_map,  ipv6 + 15 , count, BPF_ANY);


		/*Updating time measures*/
		int time_parsing = 1;
		long long int * total_parsing =  bpf_map_lookup_elem(&time_map, &time_parsing); //saco el tiempo acumulado
		long long int end_time_parser =  bpf_ktime_get_ns(); //he terminado el parseo
		long long int duration_parsing = (end_time_parser - start_time_parser); //ponemos el tiempo del parseo 
		
		if (total_parsing == NULL ){
			bpf_map_update_elem(&time_map, &time_parsing, &duration_parsing, BPF_ANY); //si no habia tiempo, lo actualizo
		}
		else{
			duration_parsing += *total_parsing;
			bpf_map_update_elem(&time_map, &time_parsing, &duration_parsing, BPF_ANY); //actualizo el tiempo
		}



	}

	return XDP_PASS;
    

}




SEC("classifier") //
int  xdp_neural_network(struct xdp_md *ctx)
{

	/*Starting header parsing*/

	long long int start_time_parser = bpf_ktime_get_ns(); // checking time

	void *data_end = (void *)(long)ctx->data_end;
	void *data = (void *)(long)ctx->data;
	struct ethhdr *eth;
	struct hdr_cursor nh;
	int eth_type;

	nh.pos = data; 

	/*Parsing the eth header of the packet*/
	eth_type = parse_ethhdr(&nh, data_end, &eth); 
	if (eth_type < 0){
		return XDP_DROP;
	}

	if (eth_type == bpf_htons(ETH_P_IP)){


		/*Parsing the original pcap*/ 
		int size = (data_end - data) - sizeof(struct ethhdr); //packet size

		unsigned char * ipv6 = NULL;
		unsigned char * type = NULL;
		unsigned char * lastbyte = NULL;

		/*There are 4 different types of packets*/

		if (size == 64){  //Type DIS: Information Solicitation - code 0 - raw IPv6

			/*Getting the IP*/

			if (nh.pos + 24> data_end) //searching for the IPv6
				return XDP_PASS;
			nh.pos += 24;

			ipv6 = nh.pos; 

			if (ipv6 + 16 > data_end) //boundary checks
				return XDP_DROP;
	
			/*Getting the type of the packet*/
			if (nh.pos + 33> data_end) 
				return XDP_DROP;
			nh.pos += 33;
		
			type = (unsigned char *)nh.pos;

			if (type + 1> data_end)
				return XDP_DROP;	

		}
		else if (size == 97){ //Type DIO: Information Object - code 1  - IPv6 without prefix and without the last byte
			
			/*Getting the last byte of the IP*/
			if (nh.pos + 7> data_end)
				return XDP_DROP;

			lastbyte = (unsigned char *)nh.pos+7; 

			if (lastbyte + 1> data_end)
				return XDP_DROP;
			
			/*Getting the type of packet*/

			if (nh.pos + 20> data_end)
				return XDP_DROP;

			type = (unsigned char *)nh.pos +20;

			if (type + 1> data_end)
				return XDP_DROP;

			/*Getting the rest of the IP*/

			if (nh.pos + 31 > data_end) //busco la IP
				return XDP_DROP;
			nh.pos += 31;

			ipv6 = nh.pos; //saco la IP

			if (ipv6 + 16 > data_end)
				return XDP_DROP;

			//Hacemos modificaciones sobre la IPv6
			ipv6[0] = 0xfe;
    		ipv6[1] = 0x80;
			ipv6[15] = lastbyte[0];		
		
		}

		else if (size == 102){ //type DIO - IP without prefix and without the last byte -- the code is 1 
			
			/*Getting the last byte of the IP*/
			if (nh.pos + 13> data_end)
				return XDP_DROP;

			lastbyte = (unsigned char *)nh.pos+13; //el ultimo byte de la ip esta en un offset de 13 desde el inicio del paquete

			if (lastbyte + 1> data_end)
				return XDP_DROP;

			/*Getting the type of the packet*/
			if (nh.pos + 25> data_end)
				return XDP_DROP;

			type = (unsigned char *)nh.pos +25;

			if (type + 1> data_end)
				return XDP_DROP;

			/*Getting the rest of the IP*/
			if (nh.pos + 36 > data_end) //busco la IP
				return XDP_DROP;
			nh.pos += 36;

			ipv6 = nh.pos; //Getting the IP

			if (ipv6 + 16 > data_end)
				return XDP_DROP;

			//hago modificaciones sobre el paqute
			ipv6[0] = 0xfe;
    		ipv6[1] = 0x80;
			ipv6[15] = lastbyte[0];
		}
		else if (size == 76){ // Type advertisment object - code 2 -- de IPv6 appears in an offset of 25 without the prefix

			/*Getting the type of the packet*/
			if (nh.pos + 25> data_end)
				return XDP_DROP;

			type = (unsigned char *)nh.pos +25;

			if (type + 1> data_end)
				return XDP_DROP;
			
			/*Getting the rest of the IP*/
			if (nh.pos + 52 > data_end) //busco la ip
				return XDP_DROP;
			nh.pos += 52;

			ipv6 = nh.pos; //saco la IP

			if (ipv6 + 16 > data_end)
				return XDP_DROP;

			/*hago modificaciones sobre la ip*/
			ipv6[0] = 0xfe;
    		ipv6[1] = 0x80;
		}
		else{
			return XDP_DROP;
		}

		/*Updating the count of packets*/
		int code = (int)type[0];

		int * count = bpf_map_lookup_elem(&ip_map, ipv6 + 15); //the key is the last byte of the IPv6

		/*If the count doesn't exists, it is set to 0*/
		if (count == NULL){ 
			int * initial_count = (int *)(int []){0,0,0, 0};
			if ((code >= 0)&&(code <=3))
				initial_count[code]++;
			bpf_map_update_elem(&ip_map, ipv6 + 15, initial_count, BPF_ANY);
			return XDP_DROP;
		}

		/*Updating the count*/
		if ((code >= 0)&&(code <=2)) 
			count[code]++;
		
		bpf_map_update_elem(&ip_map,  ipv6 + 15 , count, BPF_ANY);


		/*Updating time parsing*/
		int time_parsing = 1;
		long long int * total_parsing =  bpf_map_lookup_elem(&time_map, &time_parsing); //saco el tiempo acumulado
		long long int end_time_parser =  bpf_ktime_get_ns(); //he terminado el parseo
		long long int duration_parsing = (end_time_parser - start_time_parser); //ponemos el tiempo del parseo 
		
		if (total_parsing == NULL ){
			bpf_map_update_elem(&time_map, &time_parsing, &duration_parsing, BPF_ANY); //si no habia tiempo, lo actualizo
		}
		else{
			duration_parsing += *total_parsing;
			bpf_map_update_elem(&time_map, &time_parsing, &duration_parsing, BPF_ANY); //actualizo el tiempo
		}

		/*Checking if the time window has expired*/
		int time_ebpf = 0;
		long long int * prev_time = bpf_map_lookup_elem(&time_map, &time_ebpf); //saco el ultimo tiempo registrado
	
		if (prev_time == NULL ){
			bpf_map_update_elem(&time_map, &time_ebpf, &start_time_parser, BPF_ANY); //si no habia tiempo, lo actualizo
		}
		else if ((end_time_parser - *prev_time)  >= 5000000000){ //ha pasado el tiempo indicado
			bpf_map_update_elem(&time_map, &time_ebpf, &end_time_parser, BPF_ANY); //actualizamos con el nuevo tiempo

			/*We apply the neural network to the count of packets of each neighbour*/
			long long int start_time_nn = bpf_ktime_get_ns();
			#pragma unroll
			for (int i = 0; i<12; i++){ //recoremos todas las ip del mapa
				unsigned char key = ultByte[i];
				int32_t * valores = bpf_map_lookup_elem(&ip_map, &key);
				if (valores != NULL){ //tenemos alguna entrada de esa IP
					int32_t * entries = (int *)(int[]){valores[1],valores[0], valores[2], valores[3]};
					int result = model_predict(entries);
					if (result == 1){
						//bpf_map_update_elem(&ciberattack, &key, &result, BPF_ANY);
						char buf[] = "Tengo ciberataque en %02X con valores %d\n";//these should be removed before testing as it adds execution time
   						bpf_trace_printk(buf, sizeof(buf), key, valores[0]);
					}

				}
				int * new_count = (int *)(int []){0,0,0, 0}; //reseting the count
				bpf_map_update_elem(&ip_map, &key, new_count, BPF_ANY);
			}

			/*Updating time measeures*/
			int time_nn = 2;
			long long int * total_nn =  bpf_map_lookup_elem(&time_map, &time_nn);

			long long int end_time_nn = bpf_ktime_get_ns();
			long long int duration_nn = (end_time_nn - start_time_nn); //ponemos el tiempo de la ejecution en milisegundos
		
			if (total_nn == NULL ){
				bpf_map_update_elem(&time_map, &time_nn, &duration_nn, BPF_ANY); //si no habia tiempo, lo actualizo
			}
			else{
				duration_nn += *total_nn;
				bpf_map_update_elem(&time_map, &time_nn, &duration_nn, BPF_ANY); //actualizo el tiempo
			}
		}


	}

	return XDP_PASS;
    

}

char _license[] SEC("license") = "GPL";
