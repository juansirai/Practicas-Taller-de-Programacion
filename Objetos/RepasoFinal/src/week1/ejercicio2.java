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
public class ejercicio2 {

    /**
    2- Escriba un programa que imprima en consola el factorial de todos los números
entre 1 y 9. ¿Qué modificación debe hacer para imprimir el factorial de los
números impares solamente?

     */
    public static void main(String[] args) {
        int i;
        int factorial;
        int N;
        
        
        for (i=1;i<=9; i++){
            factorial = 1;
            N = i;
            while(N>0){
                factorial = factorial * N;
                N--;
            }
            System.out.println("Factorial de : "+i+" es: "+factorial);
        }
    }
}
