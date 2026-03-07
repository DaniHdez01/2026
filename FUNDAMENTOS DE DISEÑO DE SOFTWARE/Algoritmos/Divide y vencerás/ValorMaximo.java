public class ValorMaximo {
   public static int maximo(int v[], int i, int n){
    if (i==n){ // Caso trivial
        return v[i]; 
        /*PODRÍAMOS HACER
        else if(i +1 = n){
            return Math.max(v[i], v[n])
            }
        */
    } else {
        //Caso medio
        int medio = (n+i)/2; //Indice del medio del array
        //Sacamos datos para cada lado 
        int derecha = maximo(v, i, medio); 
        int izquierda = maximo(v, medio+1, n);  
        return Math.max(derecha, izquierda); 
    }
   }
   
   /* ESTA VERSIÓN ES OTRA MÁS SIMPLE PERO ES MUCHO MEJOR LA PRIMERA YA QUE ES MÁS PARALELIZABLE */
   public static int maxV2(int v[], int i, int n){
        if (i==n){ // Caso trivial
        return v[i]; 
        /*PODRÍAMOS HACER
        else if(i +1 = n){
            return Math.max(v[i], v[n])
            }
        */
    } else {
        int max = maxV2(v, i+1, n); 
        return Math.max(v[i], max); 
    }
   }

   public static void main(String[] args) {
    int v [] = {4,5,6,6,7,2,8,1,3, 16, 61, 3}; 
    System.out.println(maximo(v, 0, v.length-1));
    System.out.println(maxV2(v,0, v.length-1)); 
   }
}
