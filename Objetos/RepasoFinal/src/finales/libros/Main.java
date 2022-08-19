/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package finales.libros;

import PaqueteLectura.Lector;
public class Main {

    public static LibroElectronico instanciarLibroE(){
        LibroElectronico libroE;
        String titulo;
        Double precioBase;
        String formato;
        int tamanio;
        System.out.println("Instanciaremos un libro Electronico: ");
        System.out.println("Titulo: ");titulo = Lector.leerString();
        System.out.println("Precio Base: "); precioBase = Lector.leerDouble();
        System.out.println("Formato: ");formato = Lector.leerString();
        System.out.println("Tamanio: ");tamanio = Lector.leerInt();
        libroE = new LibroElectronico(titulo, precioBase, formato, tamanio);
        return libroE;
    }
 
     public static LibroImpreso instanciarLibroI(){
        LibroImpreso libroI;
        String titulo;
        Double precioBase;
        boolean tapaDura;
        System.out.println("Instanciaremos un libro Impreso: ");
        System.out.println("Titulo: ");titulo = Lector.leerString();
        System.out.println("Precio Base: "); precioBase = Lector.leerDouble();
        System.out.println("Tapa Dura:  ");tapaDura = Lector.leerBoolean();
        libroI = new LibroImpreso(titulo, precioBase, tapaDura);
        return libroI;
    }
    
    public static void main(String[] args) {
        // TODO code application logic here
        LibroElectronico unLibroE;
        LibroImpreso unLibroI;
        
        unLibroE = instanciarLibroE();
        for(int i=0;i<3;i++){
            System.out.println("Nombre autor "+(i+1)+": ");
            String autor = Lector.leerString();
            unLibroE.setAutor(autor);
        }
        
        System.out.println(unLibroE.toString());

         unLibroI = instanciarLibroI();
         for(int i=0;i<3;i++){
            System.out.println("Nombre autor "+(i+1)+": ");
            String autor = Lector.leerString();
            unLibroI.setAutor(autor);
        }
         System.out.println(unLibroI.toString());
    }
            
}
