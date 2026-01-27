
public class SumaDivideYVenceras{
    public static int suma (int v[], int i, int fin){

        if (i >= fin){
            return 0;
        }
        if (i + 1 == fin){
            return v[i];
        } else {
            int mitad = (i + fin) / 2;
            int sumaIzq = suma(v, i, mitad);
            int sumaDer = suma(v, mitad, fin);
            return sumaIzq + sumaDer;
        }
    }

    public static void main(String args[]){
        int[] v = {1,2,3,4,5};
        System.out.println(suma(v, 0, v.length));
    }
}