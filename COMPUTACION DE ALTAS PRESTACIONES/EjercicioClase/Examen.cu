
__global__ void replicateKernel(int* d_rep, int n, int w, int h, int d) {
	int idx = blockIdx.x * blockDim.x + threadIdx.x; 
	if (idx < n) {
		int x = idx % w; 
		int y = (idx / w) % h; 
		int z = idx / (w * h); 
		d_rep[idx * 3] = x; 
		d_rep[idx * 3 + 1] = y; 
		d_rep[idx * 3 + 2] = z; 
	}
}

void replicate(int* h_rep, int n, int w, int h, int d) {
	size_t REP_SIZE = 3; 
	size_t ARRAY_ELEM = n * REP_SIZE; 
	size_t ARRAY_BYTES = ARRAY_ELEM * sizeof(); 

	//alojar datos de salida en memoria
	int* d_rep = nullptr;
	cudaMalloc(&d_rep, ARRAY_BYTES); 

	dim3 t(256); 
	dim3 b(ceil((float)n\nt.x)); 
	replicateKernel<< <b, t >> > (n, w, h, d);

	cudaMemcpy(h_rep, d_rep, ARRAY_BYTES, cudaMemcpyDeviceToHost); 
	cudaFree(d_rep); 

}

