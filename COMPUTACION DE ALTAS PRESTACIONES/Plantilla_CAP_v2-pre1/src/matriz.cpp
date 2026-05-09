#include <cstdio>
#include <cstdlib> // Para malloc, free, rand, srand
#include <cstring> // Para memcpy
#include <ctime>
#include <iostream>
#include <mpi.h>
#include <omp.h>
#include <vector> // Necesario para std::vector

// Ahora para poder utilizar MPI tenemos que pasar varios parámetros a la función, entre ellos el número de procesos que
// queremos tener
int main(int argc, char* argv[]) {

    // Inicializar el entorno de MPI:
    int rank, size;
    MPI_Init(&argc, &argv);
    MPI_Comm_rank(MPI_COMM_WORLD, &rank);
    MPI_Comm_size(MPI_COMM_WORLD, &size);

    int N = 16;
    int its = 1000;

    // 1. Descomposición del dominio: Cuanas celdas hará cara proceso?
    int local_rows = N / size;
    int rows = N;
    int cols = N;
    int celds = rows * cols;
    int local_celds = (local_rows + 2) * N;

    double* arr_old = (double*)calloc(local_celds, sizeof(double));
    double* arr_new = (double*)calloc(local_celds, sizeof(double));

    // Comprobar si la asignación de memoria fue exitosa
    if (arr_old == NULL || arr_new == NULL) {
        fprintf(stderr, "Error: Fallo en la asignación de memoria.\n");
        return 1; // Indicar un error
    }

    // BUCLE DE INICIALIZACIIÓN (Podría paralelizarse pero no conviene hacerlo para esta práctica sería complicarse)
    if (rank == 0) {
        printf("Número total de celdas: %d\n", celds);
        for (int j = 0; j < N; j++) {
            arr_old[0 * N + j] = 100.0;
            arr_new[0 * N + j] = 100.0;
        }
    }
    // BUCLES CRÍTICOS PARA PARALELIZAR
    /**
     * COSAS A TENER EN CUENTA:
     * 1. Qué se puede paralelizar?
     * 2. Qué variables van a compartir?
     *      1. Los punteros a los arreglos
     *      2. La variable N que indica el tamaño de estos
     * 3. Qué variables deben ser privadas
     */
    MPI_Request requests[4];
    int req_count = 0;
#pragma omp parallel // Iniciar el entorno donde vamos a paralelizar
    {
        for (int i = 0; i < its; i++) { // BUCLE DE LAS IITERACIONES: IMPARALELIZABLE
            // CRUCIAL: Llevar las cuentas de cuantas peticiones se han producido: En caso de no hacerlo, el pruimer y
            // último proceso se quedARÁN BLOQUEADOS
            req_count = 0;
#pragma omp single
            {

                // PASO 1: Cada proceso va a recibir datos de sus vecinos de arriba para los bordes locales:
                if (rank > 0) {
                    MPI_Isend(&arr_old[1 * N], N, MPI_DOUBLE, rank - 1, 0, MPI_COMM_WORLD, &requests[req_count++]);
                    // Recibo el halo superior (índice 0) desde el vecino de arriba
                    MPI_Irecv(&arr_old[0 * N], N, MPI_DOUBLE, rank - 1, 1, MPI_COMM_WORLD, &requests[req_count++]);
                }
                // PASO 2: Comunicación con el vecino de abajo
                if (rank < size - 1) {
                    // Mando al halo inferior mis últimas filas
                    MPI_Isend(&arr_old[local_rows * N], N, MPI_DOUBLE, rank + 1, 1, MPI_COMM_WORLD,
                              &requests[req_count++]);
                    // Recibo el halo inferior (índice filas_locales + 1) desde el vecino de abajo
                    MPI_Irecv(&arr_old[(local_rows + 1) * N], N, MPI_DOUBLE, rank + 1, 0, MPI_COMM_WORLD,
                              &requests[req_count++]);
                }
            }

            // AHORA CON MPI Separamos el cálculo de las celdas interiores con el de las celdas frontera
            //  Indicamos que se cree un equipo de hilos y se reparta el bucle for
            //  Usamos schedule(static) porque todas las celdas tardan lo mismo en calcularse El enunciado pide que
            //  comparemos el estático con el dinámico
// #pragma omp parallel for schedule(static) shared(arr_old, arr_new, N)
#pragma omp for schedule(static)
            // Pusiste #pragma omp parallel for schedule(dynamic) dentro de una región que ya era paralela. Al hacer
            // esto, le estás pidiendo al sistema que los hilos que ya existen... ¡creen otro equipo de sub-hilos
            // enteros!
            for (int i = 1; i < local_rows; ++i) { // BUCLE DE FILAS
                for (int j = 1; j < N - 1; ++j) {  // BUCLE DE COLUMNAS
                    // Por qué no podemos paralelizar este for? -> Se produce Fasle Sharing ya que los datos en memoria
                    // son contíguos a diferencia del bucle anterio
                    // CÓMPUTO
                    int idx = i * N + j;
                    int up = (i - 1) * N + j;
                    int dwn = (i + 1) * N + j;
                    int lft = i * N + (j - 1);
                    int rgt = i * N + (j + 1);
                    arr_new[idx] = (arr_old[up] + arr_old[dwn] + arr_old[lft] + arr_old[rgt]) / 4.0;
                }
            }
#pragma omp single
            {
                // UNA VEZ HECHO EL CÁLCULO: Hacer que todos los procesos esperen a que terminen todos
                MPI_Waitall(req_count, requests, MPI_STATUSES_IGNORE);

                //--CÁLCULO DE CELDAS FRONTERA:
                if (rank > 0 || (rank == 0 && 1)) {
                    int i = 1;
                    for (int j = 1; j < N - 1; j++) {
                        arr_new[i * N + j] = (arr_old[(i - 1) * N + j] + arr_old[(i + 1) * N + j] +
                                              arr_old[i * N + (j - 1)] + arr_old[i * N + (j + 1)]) /
                                             4.0;
                    }
                }

                // Calcular la fila límite inferior (i = filas_locales)
                if (rank < size || (rank == size - 1 && /* lógica para no pisar el borde físico */ 1)) {
                    int i = local_rows;
                    for (int j = 1; j < N - 1; j++) {
                        arr_new[i * N + j] = (arr_old[(i - 1) * N + j] + arr_old[(i + 1) * N + j] +
                                              arr_old[i * N + (j - 1)] + arr_old[i * N + (j + 1)]) /
                                             4.0;
                    }
                }
                {
                    double* temp = arr_old;
                    arr_old = arr_new;
                    arr_new = temp;
                }
            }
        }
    }
    for (int i = 0; i < local_celds; i++) {
        printf("celda %d, del proceso RANK = %d Temperatura: %.2f \n", i, rank, arr_old[i]);
    }
    free(arr_old);
    free(arr_new);
    MPI_Finalize();
    return 0; // main debe devolver 0 para una ejecución exitosa
}