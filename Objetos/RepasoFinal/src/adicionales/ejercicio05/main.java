/*
d) Realice un programa que instancie una estantería para 5 estantes y 3 libros por estante. Almacene
7 libros en la estantería. A partir de la estantería: saque el libro “2001 Odisea del Espacio” e informe
su representación String; luego, informe
- el título del libro más grande
- el número del estante más pesado
 */
package adicionales.ejercicio05;

import PaqueteLectura.Lector;

public class main {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Estanteria unEstante;
        Libro unLibro;
        Autor unAutor;
        
      String titulo;
      double peso;
      int cantPaginas;
      Autor autor;
      String nombre;
      String biografia;
        
        //instancio estanteria
        
        unEstante = new Estanteria(5,3);
        
        //almaceno 7 libros
        int almacenados = 0;
        int i=0;
        
        while(almacenados<7 && i<5){
            int j = 0;
            while(almacenados<7 && i<5 && j<3){
                System.out.println("Ingrese titulo libro: ");
                titulo = Lector.leerString();
                System.out.println("Peso: ");
                peso = Lector.leerDouble();
                System.out.println("Cant paginas: ");
                cantPaginas = Lector.leerInt();
                System.out.println("Datos del autor: ");
                System.out.println("Nombre: ");
                nombre = Lector.leerString();
                System.out.println("Biografia: ");
                biografia = Lector.leerString();
                //instanciamos el autor
                unAutor = new Autor(nombre, biografia);
                //instanciamos el libro
                unLibro = new Libro(titulo,  peso, cantPaginas, unAutor);
                unEstante.almacenarLibro(almacenados, almacenados, unLibro);
                System.out.println("");
                almacenados++;
                j++;
            }
            i++;
        }
        
        System.out.println("Ingrese titulo a buscar: ");
        titulo = Lector.leerString();
        Libro resultado = unEstante.sacarLibro(titulo);
        if(resultado!=null)
            System.out.println(resultado.getTitulo());
        
        System.out.println("El titulo del libro mas grande es: "+unEstante.calcularLibroMasGrande().getTitulo());
        System.out.println("\n El estante mas pesado es el "+unEstante.calcularEstanteMasPesado());
    }
    
    
}
