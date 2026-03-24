
#include "cuda_runtime.h"
#include "device_launch_parameters.h"

#include <stdio.h>

//DADA UN ARRAY ORDENADO CADA HILO DEBE INTERCAMBIAR DOS ELEMENTOS ADYACENTES, SI EL ARRAY TIENE UN NUMERO IMPAR DE ELEMENTOS EL ULTIMO ELEMENTO NO SE INTERCAMBIA
__global__ void addKernel(int *d_out, int *d_in, int N)
{
	size_t idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (N % 2 != 0) {
		N = N - 1;
		d_out[N] = d_in[N];
    }
    if (idx < N/2){
        d_out[idx * 2 +1 ] = d_in[idx * 2 + 0];
        d_out[idx * 2 + 0] = d_in[idx * 2 + 1];
    }
}

int main()
{
    const int arraySize = 5;
    const int a[arraySize] = { 1, 2, 3, 4, 5 };
    const int b[arraySize] = { 10, 20, 30, 40, 50 };
    int c[arraySize] = { 0 };


    printf("{1,2,3,4,5} + {10,20,30,40,50} = {%d,%d,%d,%d,%d}\n",
        c[0], c[1], c[2], c[3], c[4]);

    return 0;
}


