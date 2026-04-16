#include <iostream>
#include <cstdio>
#include <vector> // Necesario para std::vector

 
int main(){
    int rows = 3; 
    int cols = 3; 
    int celds = rows * cols; 
    std::vector<int> celdas;


    printf("Número total de celdas: %d\n", celds); 
    for(int i = 0; i< celds; i++){
        celdas[i] = 1; 
        printf("Celda: %d Valor %d\n", i, celdas[i]); 
        int up = i - cols; 
        int dwn = i + cols; 
        int lft = i - 1; 
        int rgt = i + 1; 
        printf("Celdas adyacentes: Arriba: %d, Abajo: %d, derecha: %d, izquierda: %d \n ", up, dwn, lft, rgt); 
    }
    printf("Matriz de %d x %d\n", rows, cols);
    return 0; // main debe devolver 0 para una ejecución exitosa
}