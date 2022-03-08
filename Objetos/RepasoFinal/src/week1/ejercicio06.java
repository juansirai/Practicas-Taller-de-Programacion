/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package week1;

import PaqueteLectura.Lector;
import PaqueteLectura.GeneradorAleatorio;

public class ejercicio06 {

    /**
    6- Escriba un programa que simule el ingreso de personas a un banco. Cada
persona que ingresa indica la operación que desea realizar (0: “cobro de cheque” 1:
“depósito/ extracción en cuenta” 2: “pago de impuestos o servicios” 3: “cobro de
jubilación” 4: “cobro de planes”). La recepción de personas culmina cuando un
empleado ingresa la operación 5 (cierre del banco). Informar la cantidad de
personas atendidas por cada operación y la operación más solicitada.
     */
    public static void main(String[] args) {
        int [] operaciones;
        int CORTE = 5;
        int cant;
        int i;
        int unaOperacion;
        
        /*instanciamos el vector de operaciones*/
        operaciones = new int[5];
        
        /*inicializamos el vector en 0*/
        for (i=0;i<5;i++) operaciones[i] = 0;
        
        /*comenzamos a simular la entrada de clientes*/
        GeneradorAleatorio.iniciar();
        unaOperacion = GeneradorAleatorio.generarInt(6); //Genera un numero entre 0 y 5
        
        while(unaOperacion != CORTE){
            operaciones[unaOperacion] = operaciones[unaOperacion]+1;
            unaOperacion = GeneradorAleatorio.generarInt(6);
        }
        
        /*informo la cantidad de personas atendidas por cada operacion*/
        System.out.println("Personas atendidas por operacion: ");
        String op;
        for(i=0;i<5;i++){
            switch (i){
            case 0: op = "cobro de cheque";
                                       break;
            case 1: op = "depósito/ extracción en cuenta";
                                        break;
            case 2: op = "pago de impuestos o servicios";
                                        break;
            case 3: op = "cobro de jubilacion";
                                        break;
            case 4: op = "cobro de planes";
                                        break;
            default : op = "Operacion erronea";
                                        break;
        }
            System.out.println(op + ": "+operaciones[i]);
        }
        
        /*Buscamos el maximo*/
        int max = -1;
        int indMax = -1;
        for(i=0;i<5;i++){
            if(operaciones[i]>max){
                max = operaciones[i];
                indMax = i;
            }
        }
        switch(indMax){
            case 0: op="Cobro de cheque";
                                    break;
            case 1: op = "depósito/ extracción en cuenta";
                                        break;
            case 2: op = "pago de impuestos o servicios";
                                        break;
            case 3: op = "cobro de jubilacion";
                                        break;
            case 4: op = "cobro de planes";
                                        break;
            default : op = "Operacion erronea";
                                        break;
        }
        System.out.println("La operacion mas realizada es: "+op);
    
    }
}
