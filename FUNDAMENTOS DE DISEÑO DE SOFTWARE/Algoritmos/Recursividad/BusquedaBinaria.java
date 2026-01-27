public class BusquedaBinaria{

    public static int buscarBinaria(int []v, int i, int fin, int e){
        if(i==fin){
            return -1; 
        } else {

            int medio = (i+fin)/2; 
            if (e > v[medio]){
                return buscarBinaria(v, medio+1, fin, e); 
            } else if (e < v[medio]){
                return buscarBinaria(v, medio+1, fin, e); 
            } else {
                return v[medio]; 
            }
        }
    }
}