/*
El catalogo almacena para cada categoria (numerada de 1..15) al mejor artista
 */
package finales.galeriaArte;

/**
 *
 * @author juans
 */
public class Catalogo {
    private Artista[] vector;
    private final int DIMF =15;
    private int dimL;
    
    public Catalogo(){
        this.vector = new Artista[this.DIMF+1]; // para dejar el 0 libre y manejarme de 1 a dimf
        this.dimL  = 0;
    }
    
    public boolean hayLugar(){
        return this.dimL <= this.DIMF;
    }
    
    public void setArtista(Artista artista, int categoria){
        if(this.hayLugar()){
            this.vector[categoria] = artista;
            this.dimL++;
        }
    }
    
    public int artistasNacionalidad(String nac){
        int resultado = 0;
        for(int i=1; i<=this.DIMF;i++){
            /*ya que puedo tener categorias salteadas*/
            if(this.vector[i] != null){
                if(this.vector[i].getNacionalidad().equals(nac))
                    resultado++;
             }
        }
        return resultado;
    }
}
