

public class SumaVector {

    public static int sumaVector(int v[], int i, int fin){
        if (i==fin){
            return 0;
        } else {
            return v [i] + sumaVector(v, i+1, fin);
        }
    }
    public static void main(String[] args) {
        int v [] = {1,2,3,4,5}; 
        System.out.println(sumaVector(v, 0, v.length));
    }
}
