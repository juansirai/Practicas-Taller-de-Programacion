/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package parciales.concursoMusica;

import PaqueteLectura.Lector;

public class Main {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        String nombre;
        String instrumento;
        int edad;
        double puntaje;
        int genero;
        Concurso miConcurso;
        
        //instancio concurso con maximo de 20 alumnos por genero
        miConcurso = new Concurso(20);
        
        //instancio 5 alumnos
        for(int i=0; i<5;i++){
            System.out.println("Alumno "+(i+1));
            System.out.println("Nombre alumno: ");
            nombre = Lector.leerString();
            System.out.println("Instrumento: ");
            instrumento = Lector.leerString();
            System.out.println("Edad: ");
            edad = Lector.leerInt();
            System.out.println("Puntaje: ");
            puntaje = Lector.leerDouble();
            Alumno unAlumno = new Alumno(nombre,edad, instrumento, puntaje);
            System.out.println("Genero: ");
            genero = Lector.leerInt();
            miConcurso.inscribirAlumno(unAlumno, genero);
        }
        
        System.out.println("Alumno a buscar: ");
        nombre = Lector.leerString();
        System.out.println("Resultado: "+miConcurso.devolverInstrumento(nombre));
        
        System.out.println("Instrumento a buscar");
        instrumento = Lector.leerString();
        System.out.println("Tenemos "+miConcurso.contarInstrumentistas(instrumento)+" alumnos que tocan el "+instrumento);
    }
    
}
