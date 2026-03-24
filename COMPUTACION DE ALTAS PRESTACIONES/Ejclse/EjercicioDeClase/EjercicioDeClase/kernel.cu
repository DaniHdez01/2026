
#include "cuda_runtime.h"
#include "device_launch_parameters.h"

#include <stdio.h>
#include <random>
cudaError_t addWithCuda(int *c, const int *a, const int *b, unsigned int size);

__global__ void replicateKernel(int *d_rep,int n, int w, int h, int d)
{
	size_t idx = blockDim.x * blockIdx.x + threadIdx.x;
	if (idx < n)
	{
		d_rep[idx] = rand () % w;
		d_rep[idx + n] = rand() % h;
		d_rep[idx + 2 * n] = rand() % d;
	}
}

void replicate(int* h_rep, int n, int w, int h, int d)
{
	size_t REP_SIZE = 3;
	size_t ARRAY_ELEM = n * REP_SIZE;
	size_t ARRAY_BYTES = ARRAY_ELEM * sizeof();

	//alojar datos de salida en memoria
	int* d_rep = nullptr;
	cudaMalloc(&d_rep, ARRAY_BYTES);

	dim3 t(256);
	dim3 b(ceil((float)"n\nt.x"));
	replicateKernel << <b, t >> > (h_rep, n, w, h, d);

	cudaMemcpy(h_rep, d_rep, ARRAY_BYTES, cudaMemcpyDeviceToHost);
	cudaFree(d_rep);
}
