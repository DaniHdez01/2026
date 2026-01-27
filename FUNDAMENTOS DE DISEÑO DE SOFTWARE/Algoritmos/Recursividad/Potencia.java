

public class Potencia {
    public static int exponencial(int n, int e){
        if(e == 0){
            return 1; 
        } else if(e == 1 ){
            return n; 
        } else {
            return n * exponencial (n, e-1); 
        }
    }
    public static void main(String[] args) {
        System.out.println(exponencial(5,2)); 
    }
}
