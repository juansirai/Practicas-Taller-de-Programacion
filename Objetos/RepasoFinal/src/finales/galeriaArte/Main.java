/*
Una galeria de arte quiere reunir informacion de sus mejores artistas en un catalogo
El catalogo almacena para cada categoria (1..15) un artista. De los artistas se sabe nombre y nacionalidad.

a) genere las clases necesarias y los constructores para inicializar un catalogo (sin artistas) y los artistas a partir de sus atributos.
b)Implemente: 
  setArtista(artista, categoria)
 cantArtistas(nacionalidad) -->int
 */
package finales.galeriaArte;

import PaqueteLectura.Lector;

public class Main {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // Implemente un catalogo, e instancie dos artistas. Luego imprima la cantidad de artistas argentinos en el catalogo
        Artista unArtista;
        String unNombre;
        String unaNacionalidad;
        int categoria;
        
        Catalogo unCatalogo = new Catalogo();
        
        
        System.out.println("Vamos a instanciar a los tres artistas: \n");
        for(int i=0; i<3; i++){
            System.out.println("Artista "+i);
            System.out.println("Nombre: ");unNombre = Lector.leerString();
            System.out.println("Nacionalidad: ");unaNacionalidad = Lector.leerString();
            System.out.println("Categoria: "); categoria = Lector.leerInt();
            unArtista = new Artista(unNombre, unaNacionalidad);
            unCatalogo.setArtista(unArtista, categoria);
        }
        
        System.out.println("Cantidad de artistas Argentinos: "+unCatalogo.artistasNacionalidad("Argentino"));
    }
    
}
