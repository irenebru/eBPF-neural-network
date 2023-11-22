#include <unistd.h>
#include <arpa/inet.h>
#include <bpf/bpf.h>
#include <bpf/libbpf.h>
#include "../common/common_params.h"
#include "../common/common_user_bpf_xdp.h"
#include "neural_network_fix.h"
#include <unistd.h>
#include <time.h>
#include <string.h>

#define N_SECONDS 5 //this MACRO sets the time window

const char *pin_dir = "/sys/fs/bpf/enp0s3";
const char *file = "ip_map";
const char * tiempo = "time_map";

int main(int argc, char **argv){
	setvbuf(stdout, NULL, _IONBF, 0);
	struct bpf_map_info map_info ={};
	__u32 value[4];

	/*Open maps*/
	int map_fd = open_bpf_map_file(pin_dir, file, &map_info);
	int time_fd = open_bpf_map_file(pin_dir, tiempo, &map_info);

	if (map_fd < 0){
		fprintf(stderr, "Error opening maps, fd: %d\n", map_fd);
		return -1;
	}

	if (time_fd < 0){
		fprintf(stderr, "Error opening maps, fd %d\n", map_fd);
		return -1;
	}


	unsigned char key;
	long long int neural_time = 0; //time of neural network execution

	/*This part calls the neural network from userspace*/
	while (1){

		
		clock_t inicio = clock(); //Measure of time

		/*We start iterating our map with the count of the types of the packets*/
		int aux = bpf_map_get_next_key(map_fd, NULL, &key);

		while (aux == 0){
			if (bpf_map_lookup_elem(map_fd, &key, value) == 0){ 
		 
		 		/*This calls the neural network with the count of each type of packet received by each neighbour node*/
				int32_t * entries = (int *)(int[]){value[1],value[0], value[2], value[3]};
				int result = model_predict(entries);

				/*Updating the count of that node to 0*/
				int * new_count = (int *)(int []){0,0,0, 0};
				bpf_map_update_elem(map_fd, &key, new_count, BPF_ANY);

		 		/*Keep iterating*/
				aux = bpf_map_get_next_key(map_fd, &key, &key);
			}
			
		}

		clock_t fin = clock();
		double tiempo_total = (double)(fin - inicio) / CLOCKS_PER_SEC; //obtaining time in seconds
		neural_time += tiempo_total * 1000000000; //converting time in ns and adding it to the total time measured
				
				/*Ahora saco el tiempo*/
		int pars = 1;
		long long int parsing_time;

		if (bpf_map_lookup_elem(time_fd, &pars, &parsing_time) == 0){ //checking the time that lasts the measured procedure

			printf("%lld,", parsing_time);
		}

		printf("%lld,", neural_time);

		time_t rawtime;
  		struct tm * timeinfo;

 		time(&rawtime);
  		timeinfo = localtime(&rawtime);

		char * time_str = asctime(timeinfo);
		printf( "%s", time_str ); //showing the time

		sleep(N_SECONDS);
	}

	/*This section is used when the neural network is used in the kernel to show time measures*/
	/*If you want to use this, uncomment it and comment the part that is above*/
	// while (1) {
	// 	int exec = 0;
	// 	int pars = 1;
	// 	int nn = 2;
	// 	long long int parsing_time;
	// 	long long int nn_time;

	// 	if (bpf_map_lookup_elem(time_fd, &pars, &parsing_time) == 0){

	// 		//printf("Lo que tarda el parseo es %lld \n", tiempo);
	// 		printf("%lld,", parsing_time);
	// 	}

	// 	if (bpf_map_lookup_elem(time_fd, &nn, &nn_time) == 0){
	// 		printf("%lld,", nn_time);
	// 	}

	// 	time_t rawtime;
  	// 	struct tm * timeinfo;

 	// 	time(&rawtime);
  	// 	timeinfo = localtime(&rawtime);

	// 	char * time_str = asctime(timeinfo);

	// 	printf( "%s", time_str );
	// 	sleep(1);
	
	// }


	close(map_fd);
	close(time_fd);
	return 0;
}
