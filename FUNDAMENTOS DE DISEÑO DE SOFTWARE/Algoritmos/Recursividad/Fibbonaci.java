
public class Fibbonaci{

    public static int fibbonaci(int n) {
        if (n <= 1) {
            return n;
        } else {
            return fibbonaci(n - 1) + fibbonaci(n - 2);
        }
    }

    public static void main(String[] args) {
        int cantidad = 10; // Cambia este valor para más términos
        System.out.print("Sucesión de Fibonacci: ");
        for (int i = 0; i < cantidad; i++) {
            System.out.print(fibbonaci(i) + " ");
        }
        System.out.println();
    }
}