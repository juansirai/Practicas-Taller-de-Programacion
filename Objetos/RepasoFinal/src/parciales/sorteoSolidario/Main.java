/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package parciales.sorteoSolidario;

import PaqueteLectura.Lector;

public class Main {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        SorteoAvanzado unSorteoA;
        SorteoComun unSorteoC;
        double monto;
        
        int dni;
        double colaboracion;
        String nombre;
        Persona unaPersona;
        
        System.out.println("Instanciaremos un sorteo Avanzado: ");
        System.out.println("Ingrese monto: ");
        monto = Lector.leerDouble();
        unSorteoA = new SorteoAvanzado(monto);
        
        for(int i=0; i<4;i++){
            System.out.println("Persona "+(i+1));
            System.out.println("Nombre ");
            nombre = Lector.leerString();
            System.out.println("DNI: ");
            dni = Lector.leerInt();
            System.out.println("Colaboracion: ");
            colaboracion = Lector.leerDouble();
            unaPersona = new Persona(nombre, dni, colaboracion);
            unSorteoA.agregarPersona(unaPersona);
        }
        System.out.println("El ganador es: "+unSorteoA.sortear().toString());
        
        System.out.println("Instanciaremos un sorteo Comun: ");
        System.out.println("Ingrese monto: ");
        monto = Lector.leerDouble();
        unSorteoC = new SorteoComun(monto);
        
        for(int i=0; i<4;i++){
            System.out.println("Persona "+(i+1));
            System.out.println("Nombre ");
            nombre = Lector.leerString();
            System.out.println("DNI: ");
            dni = Lector.leerInt();
            System.out.println("Colaboracion: ");
            colaboracion = Lector.leerDouble();
            unaPersona = new Persona(nombre, dni, colaboracion);
            unSorteoC.agregarPersona(unaPersona);
        }
        System.out.println("El ganador es: "+unSorteoC.sortear().toString());
    }
    
}
