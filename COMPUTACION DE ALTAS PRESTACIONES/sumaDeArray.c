#include <stdio.h> 
#include <stdlib.h> // Para rand_r()
#include <omp.h>
#include <time.h>

int main(){
    // srand(time(NULL)); // No es necesario aquí si usamos rand_r con semillas por hilo
    int max = 1000; 
    int array [max]; 

    // Inicializa los elementos del array en paralelo
    #pragma omp parallel
    {
        int nThreads = omp_get_num_threads(); 
        int id = omp_get_thread_num(); 

        // Cada hilo necesita su propia semilla para rand_r para generar números aleatorios distintos
        unsigned int thread_seed = time(NULL) + id;

        int chunkSize = max / nThreads;
        int start_index = id * chunkSize;
        // El último hilo se encarga de los elementos restantes si 'max' no es divisible por 'nThreads'
        int end_index = (id == nThreads - 1) ? max : (id + 1) * chunkSize;

        for (int i = start_index; i < end_index; i++){
            array[i] = rand_r(&thread_seed); // Usa rand_r para generación de números aleatorios segura para hilos
        }
    }

    int longitud = sizeof(array) / sizeof(array[0]); // Calcula la longitud del array
    long long resultado = 0; // Usa long long para la suma para evitar desbordamiento
    for(int i = 0; i < longitud ; i++){
        resultado += array[i]; 
    } 

    printf("La suma total del array es: %lld\n", resultado);

    return 0; // main debe devolver 0 para una ejecución exitosa
}
