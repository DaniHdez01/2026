#include <iostream>
#include <cstdio>
#include <vector> // Necesario para std::vector
#include <time.h>
 
#include <cstdlib> // Para malloc, free, rand, srand
#include <cstring> // Para memcpy

int main(){
    int N = 0; 
    printf("Indique cuantas filas y columnas debe tener la matriz a simular: "); 
    std::cin >> N; 
    int rows = N; 
    int cols = N; 
    int celds = rows * cols; 
    double *arr_old = (double*) malloc(celds * sizeof(double));
    double *arr_new = (double*) malloc(celds * sizeof(double));

    // Comprobar si la asignación de memoria fue exitosa
    if (arr_old == NULL || arr_new == NULL) {
        fprintf(stderr, "Error: Fallo en la asignación de memoria.\n");
        return 1; // Indicar un error
    }


    //AHORA INICIALIZAMOS EL ARRAY ANTIGUO
    printf("Número total de celdas: %d\n", celds); 
    for(int i = 0; i< celds; i++){
        if (i >= 0 && i < cols) { // En este caso nos encontramso en la parte superrior de la matriz 
            arr_old[i] = 100.00; 
        } else {
            arr_old[i] = 0; //Si no es la parte de arriba, es, o un borde inferior o una celda ue no es borde y por lo tanto de momento la ponemos a 0
        }
        printf("Temperatura inicial de la celda %d: %.2f \n", i, arr_old[i]);
        }

    int its = 0; 
    printf("Indique el número de iteraciones para simular: "); 
    std::cin >> its; 
    memcpy(arr_new, arr_old, celds * sizeof(double));

    for (int i = 0; i < its; i++){
    for(int i = 1; i < rows -1; ++i){
        for(int j = 1; j < cols - 1; ++j){
            int idx = i * cols + j;
            int up = (i-1) * cols + j; 
            int dwn  = (i + 1) * cols + j;
            int lft    = i * cols + (j - 1);
            int rgt    = i * cols + (j + 1);
            arr_new[idx] = (arr_old[up] + arr_old[dwn] + arr_old[lft] + arr_old[rgt]) / 4.0;
        }

    }
        double *temp = arr_old; 
        arr_old = arr_new;
        arr_new = temp;
    }
    for(int i = 0; i<celds; i++){
        printf("celda %d, Temperatura: %.2f \n", i, arr_old[i]); 
    }
    free(arr_old); 
    free(arr_new); 
    return 0; // main debe devolver 0 para una ejecución exitosa
}