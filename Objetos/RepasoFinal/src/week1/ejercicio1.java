/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package week1;
import PaqueteLectura.Lector;
/**
 *
 * @author juans
 */
public class ejercicio1 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
               int N;
        int factorial = 1;
        
        System.out.println("Ingrese un numero: ");
        N = Lector.leerInt();
        if (N != 0){
            while(N > 0){
                factorial = factorial * N;
                N--;
            }
        }
        System.out.println("El factorial es: "+ factorial);
    }
    
}
