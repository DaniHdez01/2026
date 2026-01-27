import java.util.Arrays;

public class SelectionShort {

    public static void main(String[] args) {
        // Array de prueba desordenado
        int[] numeros = {64, 25, 12, 22, 11};

        System.out.println("Array original: " + Arrays.toString(numeros));

        // Llamamos al método de ordenamiento
        ordenarSeleccion(numeros);

        System.out.println("Array ordenado: " + Arrays.toString(numeros));
    }

    /**
     * Método que ordena un array usando Selection Sort
     * 1. Busca el menor elemento.
     * 2. Lo intercambia con el primer elemento de la sublista.
     * 3. Aplica el algoritmo al resto del array.
     */
    public static void ordenarSeleccion(int[] arr) {
        int n = arr.length;

        // Paso 3 (Iterativo): Aplica el algoritmo al resto del array
        // Nos movemos uno a uno por el límite del array desordenado
        for (int i = 0; i < n - 1; i++) {
            
            // Paso 1: Busca el menor elemento en el resto del array
            int indiceMenor = i;
            for (int j = i + 1; j < n; j++) {
                if (arr[j] < arr[indiceMenor]) {
                    indiceMenor = j; // Encontramos un nuevo mínimo
                }
            }

            // Paso 2: Lo intercambia con el primer elemento (posición i)
            // Solo hacemos el cambio si el menor no está ya en su sitio
            if (indiceMenor != i) {
                int temporal = arr[indiceMenor];
                arr[indiceMenor] = arr[i];
                arr[i] = temporal;
            }
        }
    }
}