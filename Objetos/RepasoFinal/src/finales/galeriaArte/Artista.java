/*
De los artistas se registra nombre artístico y nacionalidad...
 */
package finales.galeriaArte;

/**
 *
 * @author juans
 */
public class Artista {
    private String nombreArtistico;
    private String nacionalidad;
    
    public Artista(){}
    
    public Artista(String nombreArtistico, String nacionalidad){
        this.nombreArtistico = nombreArtistico;
        this.nacionalidad = nacionalidad;
    }
    
    public String getNombre(){
        return this.nombreArtistico;
    }
    public void setNombre(String nombreArtistico){
        this.nombreArtistico  =nombreArtistico;
    }
    
    public String getNacionalidad(){
        return this.nacionalidad;
    }
    public void setNacionalidad(String nacionalidad){
        this.nacionalidad = nacionalidad;
    }
}
