import java.util.ArrayList;
import java.util.Arrays;


public class Backtracking {
    public static class Resultado{
    int []secuencia;

    // Constructor
    public Resultado(int[] secuencia) {
        // Se crea una copia del array para evitar que modificaciones externas afecten el resultado almacenado.
        this.secuencia = Arrays.copyOf(secuencia, secuencia.length);
    }

    // Método toString para imprimir el contenido del array secuencia
    @Override
    public String toString() {
        return Arrays.toString(secuencia);
    }


    
    
}
    public static ArrayList <Resultado> secuencias(int n){
        ArrayList <Resultado> resultados = new ArrayList<>();
        int []secuenciaActual = new int[n];
        for (int i = 0; i< n; i++){
            secuenciaActual[i] = -1; 
        }
        backtraking(resultados, secuenciaActual, n, 0);
        return resultados; 
        
    } 
    private static void backtraking (ArrayList <Resultado> resultados,int[] secuenciaActual, int n, int i){
        if (i == n){
            Resultado solucionActual = new Resultado(secuenciaActual); 
            resultados.add(solucionActual); 
            return; 
        } 
        if(i == 0){
            secuenciaActual[i] = 0; 
            backtraking(resultados, secuenciaActual, n, i+1);
            secuenciaActual[i] = 1; 
            backtraking(resultados, secuenciaActual, n, i+1); 
        } else if(i == 1){
            if(secuenciaActual[i-1] == 1){
                secuenciaActual[i] = 0; 
                backtraking(resultados, secuenciaActual, n, i+1);
            } else {
                secuenciaActual[i] = 0; 
                backtraking(resultados, secuenciaActual, n, i+1);
                secuenciaActual[i] = 1; 
                backtraking(resultados, secuenciaActual, n, i+1); 
            }
        } else {
            if (secuenciaActual[i-2] == 0 && secuenciaActual[i-1] == 0){
                secuenciaActual[i] = 1; 
                backtraking(resultados, secuenciaActual, n, i+1);
            } else{
                secuenciaActual[i] = 0; 
                backtraking(resultados, secuenciaActual, n, i+1);                
            } 
    }
    secuenciaActual[i] = -1; 
    }

    public static void main(String[] args) {
        ArrayList <Resultado> resultados = new ArrayList<>(); 
        resultados = secuencias(4); 
        for(Resultado resultado : resultados){ // Itera sobre cada objeto Resultado en la lista
            System.out.println(resultado); // Imprime la representación en cadena del objeto Resultado
        }
    }
}
