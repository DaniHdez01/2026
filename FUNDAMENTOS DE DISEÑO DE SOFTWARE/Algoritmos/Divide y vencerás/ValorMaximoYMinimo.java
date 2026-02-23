

public class ValorMaximoYMinimo{

public class ValorMaximo {
   public static Resultado maximo(int v[], int i, int n){
    if (i==n){ // Caso trivial
        return new Resultado(v[i], v[i]); 
        /*PODRÍAMOS HACER
        else if(i +1 = n){
            return Math.max(v[i], v[n])
            }
        */
    } else {
        //Caso medio
        int medio = (n+i)/2; //Indice del medio del array
        //Sacamos datos para cada lado 
        Resultado derecha = maximo(v, i, medio); 
        Resultado izquierda = maximo(v, medio+1, n);  
        int max = Math.max(derecha.getMaximo(), izquierda.getMaximo());
        int min = Math.min(derecha.getMinimo(), izquierda.getMinimo()); 
        return new Resultado(max, min); 
    }
   }

   public static void main(String[] args) {
    int v [] = {4,5,6,6,7,2,8,1,3, 16, 61, 3}; 
    Resultado resultado = maximo(v, 0, v.length-1); 
    System.out.println("Valor mínimo del array: " + resultado.getMinimo() + "\n Valor máximo del array: " + resultado.getMaximo());
   }
}

}
class Resultado{
    int maximo; 
    int minimo;
    public Resultado(int maximo, int minimo) {
        this.maximo = maximo;
        this.minimo = minimo;
    }
    public int getMaximo() {
        return maximo;
    }
    public void setMaximo(int maximo) {
        this.maximo = maximo;
    }
    public int getMinimo() {
        return minimo;
    }
    public void setMinimo(int minimo) {
        this.minimo = minimo;
    } 

    
}