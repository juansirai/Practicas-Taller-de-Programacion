/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package parciales.premiaciones;

import PaqueteLectura.Lector;

public class Main {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        MejorGraduado mejorG;
        ProntaGraduacion prontaG;
        Alumno unAlumno;
        String unNombre;
        int unAnioE;
        int unAnioI;
        double unPromedio;
        
        System.out.println("Instanciamos Premiacion al mejor Graduado: ");
        System.out.println("Ingrese cantidad: ");
        int N = Lector.leerInt();
        mejorG = new MejorGraduado(N);
        for(int i=0;i<N;i++){
            System.out.println("Nombre: ");unNombre = Lector.leerString();
            System.out.println("Anio Ingreso: ");unAnioI = Lector.leerInt();
            System.out.println("Anio egreso: ");unAnioE =Lector.leerInt();
            System.out.println("Promedio: ");unPromedio = Lector.leerDouble();
            unAlumno = new Alumno(unNombre, unPromedio, unAnioI, unAnioE);
            mejorG.agregarPostulante(unAlumno);
    }
        System.out.println("Instanciamos Premiacion al pronto Graduado: ");
        System.out.println("Ingrese cantidad: ");
        N = Lector.leerInt();
        prontaG = new ProntaGraduacion(N);
        for(int i=0;i<N;i++){
            System.out.println("Nombre: ");unNombre = Lector.leerString();
            System.out.println("Anio Ingreso: ");unAnioI = Lector.leerInt();
            System.out.println("Anio egreso: ");unAnioE =Lector.leerInt();
            System.out.println("Promedio: ");unPromedio = Lector.leerDouble();
            unAlumno = new Alumno(unNombre, unPromedio, unAnioI, unAnioE);
            prontaG.agregarPostulante(unAlumno);
    }
        
        System.out.println("Ingese promedio minimo: ");N = Lector.leerInt();
        System.out.println(mejorG.otorgarPremio(N));
        
        System.out.println("Ingese cantidad de anios minimos: ");N = Lector.leerInt();
        System.out.println(prontaG.otorgarPremio(N));
    }
    
}
