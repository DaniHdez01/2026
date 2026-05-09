#include <cuda_runtime.h>
#include <iostream>

// DEFINICIÓN DEL KERNEL:

__global__ void stencil_Kernel(double* arr_old, double* arr_new, int N) {
    // Mapeo de hilos a la matriz
    int j = blockIdx.x * blockDim.x + threadIdx.x; // Columnas (Eje X)
    int i = blockIdx.y * blockDim.y + threadIdx.y; // Filas (Eje Y)
    if (i > 0 && i < N - 1 && j > 0 && j < N - 1) {

        int idx = i * N + j;
        int up = (i - 1) * N + j;
        int dwn = (i + 1) * N + j;
        int lft = i * N + (j - 1);
        int rgt = i * N + (j + 1);

        // Cada hilo hace su propio promedio leyendo de la Memoria Global
        arr_new[idx] = (arr_old[up] + arr_old[dwn] + arr_old[lft] + arr_old[rgt]) / 4.0;
    }
}
int main() {
    int N = 16;
    int its = 1000;

    int rows = N;
    int cols = N;
    int celds = rows * cols;
    size_t size = celds * sizeof(double);

    double* arr_cpu = (double*)calloc(celds, sizeof(double));
    double* arr_old;
    double* arr_new;

    for (int i = 0; i < cols; i++) {
        arr_cpu[i] = 100.00;
    }
    // Paso 1 de CUDA: Reservar memoria para la GPU del doble buffer
    cudaMalloc(&arr_old, size);
    cudaMalloc(&arr_new, size);

    // Paso 2: Host to device: Pasar los datos de la CPU a la GPU:
    cudaMemcpy(arr_old, arr_cpu, size, cudaMemcpyHostToDevice);
    cudaMemcpy(arr_new, arr_cpu, size, cudaMemcpyHostToDevice);

    // Paso 3: Dimensiones para cada Hilo
    dim3 threadsPerBlock(16, 16);
    // Número de bloques por hilo
    dim3 numBlocks((N + 15) / 16, (N + 15) / 16); // (N + hilos_por_bloque - 1) / hilos_por_bloque

    // Paso 4: Bucle de iteraciones:
    for (int t = 0; t < its; t++) {
        // Lanzamos el kernel:
        stencil_Kernel<<<numBlocks, threadsPerBlock>>>(arr_old, arr_new, N);

        // Sincronizamos para asegurar que la GPU terminó el fotograma
        cudaDeviceSynchronize();

        // SWAP DE PUNTEROS (Instantáneo, ocurre en la memoria de la GPU)
        double* temp = arr_old;
        arr_old = arr_new;
        arr_new = temp;
    }

    // Paso 5: Una vez hecho el cálculo hacemos el device to Host
    cudaMemcpy(arr_cpu, arr_old, size, cudaMemcpyDeviceToHost);
    // Paso 6: Imprimir el array de la CPU para ver que los cálculos son correctos:
    printf("=== MAPA DE CALOR FINAL ===\n");
    for (int i = 0; i < N; i++) {
        for (int j = 0; j < N; j++) {
            printf("%6.2f ", arr_cpu[i * N + j]);
        }
        printf("\n"); // Salto de línea al terminar la fila
    }
    // Paso FINAL: Liberar la GPU y el array de la CPU
    cudaFree(arr_old);
    cudaFree(arr_new);
    free(arr_cpu);
}