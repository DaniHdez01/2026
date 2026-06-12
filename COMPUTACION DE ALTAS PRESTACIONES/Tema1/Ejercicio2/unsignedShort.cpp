#include <list>
#include <time.h>
#include <stdlib.h>
#include <iostream>
#include <vector>

int main(){
    int size = 10000; 
    std::vector<unsigned short> lista1(size); 
    std::vector<unsigned short> lista2(size);
    std::vector<unsigned short> resultado(size);

    for(int i = 0; i < size; i++){
        lista1[i] = 1 + rand() % 10000; 
        lista2[i] = 1 + rand() % 10000; 
    }
    time_t inicio = clock(); 

    for(int i = 0; i< 10000; i++){
        resultado[i] = lista1[i] + lista2[i]; 
    }

    time_t final = clock(); 
     double finalTime = (double)(final-inicio)/CLOCKS_PER_SEC;
     
     printf("Tiempo de ejecución: %.12f\n", finalTime); 
     return 0; 
}