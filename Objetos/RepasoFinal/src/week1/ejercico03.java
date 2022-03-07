/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package week1;
import PaqueteLectura.Lector;

public class ejercico03 {

    /**
  Escriba un programa que lea las alturas de los 15 jugadores de un equipo de
básquet y las almacene en un vector. Luego informe:
- la altura promedio
- la cantidad de jugadores con altura por encima del promedio
     */
    public static void main(String[] args) {
        double [] jugadores = new double[15];
        double altura;
        int cantidad;
        double promedio;
        int i;
        
        /*Cargar vector*/
        for (i=0; i<15;i++){
            System.out.println("Ingrese altura "+i+": ");
            jugadores[i] = Lector.leerDouble();
        }
        
        /*Imprimimos vector*/
        for(i=0;i<15;i++){
            System.out.println(i+": Altura "+jugadores[i]);
        }
        
        /*calculamos promedio*/
        altura = 0;
        for (i=0; i<15;i++) altura = altura+jugadores[i];
        promedio = altura/15;
        
        /*Jugadores encima de promedio*/
        cantidad = 0;
        for (i=0;i<15;i++){
            if(jugadores[i]>promedio) cantidad++;
        }
        
        /*Imprimimos*/
        System.out.println("Altura Promedio: "+promedio);
        System.out.println("Jugadores por encima del promedio: "+ cantidad);
    }
    
}
