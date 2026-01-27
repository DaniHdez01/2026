public class indiceValor {
    public static int elemento (int []v, int i, int fin){
        if (i>fin){
            return -1; 
        } else {
            int medio = (i+fin) / 2; 
            if(v[medio] == medio){
                return medio; 
            } else if (v[medio] > medio){
                return elemento(v, i, medio-1); 
            } else {
                return elemento(v, medio+1, fin); 
            } 
        }
    }
    public static void main(String[] args) {
        System.err.println(elemento (new int[]{-10,-6,-2,1,4,6,9,10,12,15,16,18,20}, 0, 12));
    }
}
