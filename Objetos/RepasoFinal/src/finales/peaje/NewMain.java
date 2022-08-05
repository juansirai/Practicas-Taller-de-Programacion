/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package finales.peaje;

import PaqueteLectura.Lector;

public class NewMain {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
       Sistema sistema = new Sistema();
       
       
       for(int i=0;i<20;i++){
           sistema.registrarAleatorio();
       }
       System.out.println(sistema.reporteVentanillas());
       System.out.println("\n Ventanilla con menor monto promedio: "+sistema.ventanillaMenorRecaudacion());
    }
    
}
