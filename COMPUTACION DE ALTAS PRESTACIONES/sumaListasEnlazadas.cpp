#include <iostream>
#include <list>
#include <vector>
#include <cstdlib>
#include <cstdio>
#include <time.h> // Para time()

/*• Desarrolla un programa que rellene 2 listas enlazadas de enteros aleatorios y almacene la suma en una tercera lista enlazada. 
• Las listas enlazadas pueden obtenerse por IA, buscando el código online, o utilizando en C++ std::list<int>. 
• Mide el tiempo consumido en la suma (exclusivamente) • Varía el tamaño de los arrays o el número de iteraciones hasta que el tiempo medido esté en torno a 1s. 
• Repite la operación pero utilizando arrays reservados dinámicamente (malloc). En C++ pueden reservarse con new, o utilizar en su lugar std::vector<int>. 
• Compara los tiempos en el ejercicio con arrays con –O0 y –O2 • Repite el ejemplo con arrays pero recorriendo en orden inverso*/
int main(){
    srand(time(NULL)); 

    std::list<int> lista1;
    std::list<int> lista2; 

    for(int i = 0;  i < 100; i++) {
        lista1.push_back(rand()); 
        lista2.push_back(rand()); 
    }

    int suma1 = 0; 
    int suma2 = 0; 

    time_t t1 = clock();
    for(int i = 0; i< 100; i++){
        suma1 = suma1 + lista1.front();
        lista1.pop_front();  
        suma2 = suma2 + lista2.front(); 
        lista2.pop_front(); 
    }
    time_t t2 = clock(); 
    double elapsed = (double)(t2-t1)/CLOCKS_PER_SEC;
    printf("Suma de los arrays: \n Array 1: %d \n Array 2: %d \n", suma1, suma2); 
    printf("Tiempo total de ejecución: %d nanosegundos"); 
    return 0; 
}