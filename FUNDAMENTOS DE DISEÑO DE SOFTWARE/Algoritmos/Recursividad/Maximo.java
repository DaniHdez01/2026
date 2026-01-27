

public class Maximo {
    
    public static int maximo(int v[], int i, int fin){
        if (i==fin){
            return v[i];
        } else {
            return Math.max(v[i], maximo(v, i+1, fin)); 
        }
    } 
    public static void main(String[] args) {
        int []v = {1,5,4,4,6,23}; 
        System.out.println(maximo(v, 0, v.length-1));
    }
}
