#include <stdio.h> 

int main(){
    int array [] = {1,2,3,4,5,6};
    int longitud = sizeof(array) / sizeof(array[0]); // Calcula la longitud del array
    int resultado = 0;
    for(int i = 0; i < longitud ; i++){
        resultado += array[i]; 
    } 
    return resultado;
}
