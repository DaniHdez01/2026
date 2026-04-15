#include <iostream>
#include <cstdio>
#include <vector> // Necesario para std::vector

struct Matriz{
    int rows, cols; 
    std::vector<int> celdas; // Usar std::vector para un array dinámico
}; 
int main(){
    Matriz miMatriz; 
    miMatriz.rows = 3; 
    miMatriz.cols = 3; 
    int celds = miMatriz.rows * miMatriz.cols; 

    // Redimensionar el vector para que tenga el tamaño correcto
    miMatriz.celdas.resize(celds);

    printf("Número total de celdas: %d\n", celds); 
    for(int i = 0; i< celds; i++){
        miMatriz.celdas[i] = 1; 
        printf("Celda: %d Valor %d\n", i, miMatriz.celdas[i]); 
        int up = i -miMatriz.cols; 
        int dwn = i + miMatriz.cols; 
        int lft = i - 1; 
        int rgt = i + 1; 
        printf("Celdas adyacentes: Arriba: %d, Abajo: %d, derecha: %d, izquierda: %d \n ", up, dwn, lft, rgt); 
    }
    printf("Matriz de %d x %d\n", miMatriz.rows, miMatriz.cols);
    return 0; // main debe devolver 0 para una ejecución exitosa
}