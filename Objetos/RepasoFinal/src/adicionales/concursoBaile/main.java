/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package adicionales.concursoBaile;

import PaqueteLectura.Lector;

public class main {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Concurso miConcurso;
        int N;
        
        int dni;
        String nombre;
        int edad;
        
        Participante persona;
        Pareja pareja;
        
        System.out.println("Bienvenidos al concurso de baile!");
        System.out.println("Procederemos a la carga de parejas, ingrese la cantidad maxima ");
        N = Lector.leerInt();
        miConcurso = new Concurso(N);
        String continua = "yes";
        while(continua.equals("yes") && miConcurso.hayLugar()){
            System.out.println("Carga de pareja " + miConcurso.cantParejas());
            pareja = new Pareja();
            for(int i=0; i<2;i++){
                System.out.println("Integrante "+i);
                System.out.println("DNI: ");dni = Lector.leerInt();
                System.out.println("Nombre: ");nombre = Lector.leerString();
                System.out.println("Edad: ");edad = Lector.leerInt();
                persona = new Participante(dni, nombre, edad);
                pareja.setParticipante(persona);
            }
            miConcurso.agregarPareja(pareja);
            System.out.println("Desea continuar? ");continua = Lector.leerString();
        }
        System.out.println("Pareja con mas diferencia de edad: "+miConcurso.mayorDifEdad().toString());
    }
    
}
