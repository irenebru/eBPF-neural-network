#include <math.h>
#include <stdlib.h>
#include <stdint.h>

#ifndef __NEURAL_NETWORK_FIX_H
#define __NEURAL_NETWORK_FIX_H

#define N_LAYERS 3 //number of layers
#define MAX_LENGTH_BUFFERS 4 //AUX BUFFERS LENGTH
#define FIXED_POINT_BITS 15 // bits that represent the fractional part

//inputs and outputs of each layer - this should be adapted to your neural network
static const int outputs[N_LAYERS] = {2, 1,1};
static const int inputs[N_LAYERS] = {4, 2, 1};


//activation functions
typedef enum _EmlNetActivationFunction {
    EmlNetActivationIdentity = 0,
    EmlNetActivationRelu,
    EmlNetActivationFunctions,
} EmlNetActivationFunction;

//struct of a layer
typedef struct _EmlNetLayer {
    int32_t n_outputs;
    int32_t n_inputs;
    const int32_t *weights;
    const int32_t *biases;
    EmlNetActivationFunction activation;
} EmlNetLayer;

//struct of the neural network
typedef struct _EmlNet {
    // Layers of the neural network
    int32_t n_layers;
    const EmlNetLayer *layers;
    // Buffers for storing activations
    int32_t *activations1;
    int32_t *activations2;
    int32_t activations_length;
} EmlNet;

static int32_t model_buf1[MAX_LENGTH_BUFFERS];
static int32_t model_buf2[MAX_LENGTH_BUFFERS];


//weights and biases of each layer - this should be adapted to your neural network
static const int32_t model_layer0_weights[8] = { 51203, 3853, -21013, 16998, 7988, -5358, 12, 0 };
static const int32_t model_layer0_biases[2] = { 43371, -10468 };
static const int32_t model_layer1_weights[2] = { 59604, -7957 };
static const int32_t model_layer1_biases[1] = { 9674 };
static const int32_t model_layer2_weights[1] = { -24584 };
static const int32_t model_layer2_biases[1] = { 54859 };

static const EmlNetLayer model_layers[3] = { 
    { 2, 4, model_layer0_weights, model_layer0_biases, EmlNetActivationRelu }, 
    { 1, 2, model_layer1_weights, model_layer1_biases, EmlNetActivationRelu }, 
    { 1, 1, model_layer2_weights, model_layer2_biases, EmlNetActivationIdentity } };
static EmlNet model = { 3, model_layers, model_buf1, model_buf2, 4 };



/*ReLU function*/
static __always_inline int32_t relu_fixed(int32_t x_fixed) {
  int32_t relu_x_fixed;
  int32_t x_int = x_fixed >> FIXED_POINT_BITS; // Convertimos a entero
  if (x_int >= 0) {
    relu_x_fixed = x_fixed;
  } else {
    relu_x_fixed = 0;
  }
  return relu_x_fixed;
}

//multiplication in fixed point
static __always_inline int32_t mult (int32_t a, int32_t b){
    int64_t prod = (int64_t)a * (int64_t) b;
    prod >>= FIXED_POINT_BITS;
    return (int32_t)prod;
}

//mathematics of each layer
//input: layer, input buffer, output buffer and number of layer
static __always_inline int32_t eml_net_layer_forward(const EmlNetLayer *layer, int32_t * in, int32_t * out, int32_t n_layer){
    
	int w_idx;
	int32_t w;

    #pragma unroll
    for (int o=0; o < outputs[n_layer]; o++) {
        int32_t sum = 0;
        #pragma unroll
        for (int i=0; i<inputs[n_layer]; i++) {
            w_idx = o+(i*outputs[n_layer]); // index
            w = layer->weights[w_idx]; //weight*input
            sum += mult(w, in[i]); 
        }
    // bias + (weight * input)
        out[o] = sum + layer->biases[o];

    }

    

    //activation funciton
    if (layer->activation == EmlNetActivationIdentity) {
        // no-op
    } else if (layer->activation == EmlNetActivationRelu) {
        #pragma unroll
	    for (int i=0; i<outputs[n_layer]; i++) {
            out[i] =relu_fixed(out[i]);
        }
    } 
    else {
        return -1;
    }

	return 0;
}

//Neural network logic 
static __always_inline int32_t eml_net_infer(const EmlNet * model, int32_t * features){   
    
    //aux buffers
    int32_t * buffer1 = model->activations1;
    int32_t *buffer2 = model->activations2;

	// Input layer
    eml_net_layer_forward(&model->layers[0], features, buffer1, 0);

    // Hidden layers
    #pragma unroll
    for (int l=1; l<N_LAYERS-1; l++) {
        const EmlNetLayer *layer = &model->layers[l];//current layer
        //aplicamos la logica a la capa
        eml_net_layer_forward(layer, buffer1, buffer2, l);
        #pragma unroll
	    for (int i=0; i<MAX_LENGTH_BUFFERS; i++) {
            buffer1[i] = buffer2[i]; 
        }
    }	
	
    // Output layer
    eml_net_layer_forward(&model->layers[N_LAYERS-1], buffer1, buffer2, N_LAYERS-1);;				

    return 0;
}

//this function calls the neural network and makes the final classification
static __always_inline int32_t eml_net_predict(const EmlNet * model, int32_t * features){
    eml_net_infer(model, features); //this calls the neural network

    int32_t out_fix = model->activations2[0];
    int32_t out_int = out_fix >> FIXED_POINT_BITS; // converting Fixed -> integer
    /*Avoiding sigmoid function with this*/
    if (out_int > 0) {
        return 1;
    } else {
     return 0;
    }
}

/*Converting integer -> fixed point integer*/
static __always_inline int32_t to_fix(int32_t entrie){
    int32_t a = entrie << FIXED_POINT_BITS;
    int32_t output = round(a);
    if (a < 0){// this applies the sign
        output = abs(output);
        output = ~output;
        output++;
    }
    return output;
}

static __always_inline int32_t model_predict(int32_t * in)
{
    int32_t fix_entries[4] = {to_fix(in[0]), to_fix(in[1]), to_fix(in[2]), to_fix(in[3])}; 
    return eml_net_predict(&model, fix_entries);
}

#endif