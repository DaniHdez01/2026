

import javax.swing.JOptionPane;

public class Fibbonaci{

    public static int fibbonaci(int n) {
        if (n <= 1) {
            return n;
        } else {
            return fibbonaci(n - 1) + fibbonaci(n - 2);
        }
    }

    public static void main(String[] args) {
        System.out.print("Introduce la cantidad de términos de Fibonacci que deseas calcular: ");
        int cantidad = Integer.parseInt(JOptionPane.showInputDialog(null, "Cuantos números de la sucesion deseas calcular?", "Entrada de datos", JOptionPane.QUESTION_MESSAGE));
        int [] salida = new int[cantidad]; 
        for (int i = 0; i < cantidad; i++) {
            salida[i] = fibbonaci(i);
        }

        // Construir la cadena de salida para el JOptionPane
        StringBuilder sb = new StringBuilder("Sucesión de Fibonacci: ");
        for (int num : salida) {
            sb.append(num).append(" ");
        }
        
        // Mostrar la secuencia en un cuadro de mensaje
        JOptionPane.showMessageDialog(null, sb.toString().trim(), "Salida de Fibonacci", JOptionPane.INFORMATION_MESSAGE);
    }
}