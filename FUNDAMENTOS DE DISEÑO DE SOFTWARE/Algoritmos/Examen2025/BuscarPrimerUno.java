public class BuscarPrimerUno {

    // Método principal que inicializa la recursividad
    public static int buscarPrimerUno(int[] arr) {
        if (arr == null || arr.length == 0) {
            return -1;
        }
        return buscarPrimerUnoRecursivo(arr, 0, arr.length - 1);
    }

    // Método recursivo basado en Divide y Vencerás
    private static int buscarPrimerUnoRecursivo(int[] arr, int inicio, int fin) {
        // Caso base: si el rango de búsqueda es inválido, no se encontró el 1
        if (inicio > fin) {
            return -1;
        }

        // Calculamos el punto medio para dividir el array
        int medio = inicio + (fin - inicio) / 2;

        // Si encontramos un 1, comprobamos si es el primero
        if (arr[medio] == 1) {
            // Es el primer 1 si está en la posición 0 o si el anterior es un 0
            if (medio == 0 || arr[medio - 1] == 0) {
                return medio;
            } else {
                // Si no es el primero, el primer 1 debe estar en la mitad izquierda
                return buscarPrimerUnoRecursivo(arr, inicio, medio - 1);
            }
        } else {
            // Si es un 0, el primer 1 (si existe) debe estar en la mitad derecha
            return buscarPrimerUnoRecursivo(arr, medio + 1, fin);
        }
    }

    public static void main(String[] args) {
        // Casos de prueba propuestos
        int[] a1 = {0, 0, 0, 1, 1, 1};
        int[] a2 = {0, 0, 0, 0};
        int[] a3 = {1, 1, 1};
        int[] a4 = {0, 1};
        int[] a5 = {0};
        int[] a6 = {0, 0, 0, 1, 1, 1};
        int[] a7 = {0, 0, 1, 1, 1, 1, 1};

        // Salidas por consola
        System.out.println(buscarPrimerUno(a1)); // Salida esperada: 3
        System.out.println(buscarPrimerUno(a2)); // Salida esperada: -1
        System.out.println(buscarPrimerUno(a3)); // Salida esperada: 0
        System.out.println(buscarPrimerUno(a4)); // Salida esperada: 1
        System.out.println(buscarPrimerUno(a5)); // Salida esperada: -1
        System.out.println(buscarPrimerUno(a6)); // Salida esperada: 3
        System.out.println(buscarPrimerUno(a7)); // Salida esperada: 2
    }
}