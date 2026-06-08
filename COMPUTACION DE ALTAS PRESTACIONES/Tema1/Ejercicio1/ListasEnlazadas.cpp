#include <list>
#include <time.h>
#include <stdlib.h>
#include <iostream>
int main(){
     std::list<int> lista1; 
     std::list<int> lista2; 
     std::list<int> resultados;
     
     for(int i = 0; i< 10000; i++){
        lista1.push_back(1 + rand() % 100); 
        lista2.push_back(1 + rand() % 100); 
     }

     time_t inicio = clock(); 

     for (int i = 0; i < 10000; i++){
        resultados.push_back(lista1.front() + lista2.front()); 
        lista1.pop_front(); 
        lista2.pop_front(); 
     }

     time_t final = clock(); 
     double finalTime = (double)(final-inicio)/CLOCKS_PER_SEC;
     
     printf("Tiempo de ejecución: %g\n", finalTime); 
     return 0; 
}