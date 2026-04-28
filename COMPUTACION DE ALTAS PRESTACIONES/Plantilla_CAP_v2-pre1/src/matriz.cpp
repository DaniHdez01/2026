#include <cstdio>
#include <cstdlib> // Para malloc, free, rand, srand
#include <cstring> // Para memcpy
#include <ctime>
#include <iostream>
#include <omp.h>
#include <vector> // Necesario para std::vector

int main() {
    int N = 0;
    printf("Indique cuantas filas y columnas debe tener la matriz a simular: ");
    std::cin >> N;
    int rows = N;
    int cols = N;
    int celds = rows * cols;
    double* arr_old = (double*)malloc(celds * sizeof(double));
    double* arr_new = (double*)malloc(celds * sizeof(double));

    // Comprobar si la asignación de memoria fue exitosa
    if (arr_old == NULL || arr_new == NULL) {
        fprintf(stderr, "Error: Fallo en la asignación de memoria.\n");
        return 1; // Indicar un error
    }

    // AHORA INICIALIZAMOS EL ARRAY ANTIGUO
    printf("Número total de celdas: %d\n", celds);

    // BUCLE DE INICIALIZACIIÓN (Podría paralelizarse pero no conviene hacerlo para esta práctica sería complicarse)
    for (int i = 0; i < celds; i++) {
        if (i >= 0 && i < cols) { // En este caso nos encontramso en la parte superrior de la matriz
            arr_old[i] = 100.00;
        } else {
            arr_old[i] = 0; // Si no es la parte de arriba, es, o un borde inferior o una celda ue no es borde y por lo
                            // tanto de momento la ponemos a 0
        }
        printf("Temperatura inicial de la celda %d: %.2f \n", i, arr_old[i]);
    }

    int its = 0;
    printf("Indique el número de iteraciones para simular: ");
    std::cin >> its;
    memcpy(arr_new, arr_old, celds * sizeof(double));
    // BUCLES CRÍTICOS PARA PARALELIZAR
    /**
     * COSAS A TENER EN CUENTA:
     * 1. Qué se puede paralelizar?
     * 2. Qué variables van a compartir?
     *      1. Los punteros a los arreglos
     *      2. La variable N que indica el tamaño de estos
     * 3. Qué variables deben ser privadas
     */
    unsigned t0, t1;
    t0 = clock();
#pragma omp paralell // Iniciar el entorno donde vamos a paralelizar
    {
        for (int i = 0; i < its; i++) { // BUCLE DE LAS IITERACIONES: IMPARALELIZABLE

            // Indicamos que se cree un equipo de hilos y se reparta el bucle for
            // Usamos schedule(static) porque todas las celdas tardan lo mismo en calcularse El enunciado pide que
            // comparemos el estático con el dinámico
// #pragma omp parallel for schedule(static) shared(arr_old, arr_new, N)
#pragma omp parallel for schedule(dynamic)
            for (int i = 1; i < rows - 1; ++i) {     // BUCLE DE FILAS
                for (int j = 1; j < cols - 1; ++j) { // BUCLE DE COLUMNAS
                    // Por qué no podemos paralelizar este for? -> Se produce Fasle Sharing ya que los datos en memoria
                    // son contíguos a diferencia del bucle anterior

                    // CÓMPUTO
                    int idx = i * cols + j;
                    int up = (i - 1) * cols + j;
                    int dwn = (i + 1) * cols + j;
                    int lft = i * cols + (j - 1);
                    int rgt = i * cols + (j + 1);
                    arr_new[idx] = (arr_old[up] + arr_old[dwn] + arr_old[lft] + arr_old[rgt]) / 4.0;
                }
            }
#pragma omp single
            {
                double* temp = arr_old;
                arr_old = arr_new;
                arr_new = temp;
            }
        }
    }
    t1 = clock();
    double time = (double(t1 - t0) / CLOCKS_PER_SEC);
    for (int i = 0; i < celds; i++) {
        printf("celda %d, Temperatura: %.2f \n", i, arr_old[i]);
    }
    std::cout << "Tiempo de ejecución: " << time << " segundos" << std::endl;
    free(arr_old);
    free(arr_new);
    return 0; // main debe devolver 0 para una ejecución exitosa
}