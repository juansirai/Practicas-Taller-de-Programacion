/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package adicionales.ejercicio02;

/**
 *
 * @author juans
 */
public abstract class Recital {
    private String nombreBanda;
    private String[] listaTemas;
    private int DIMF;
    private int dimL;
    private boolean finalizado;
    
    public Recital(String nombreBanda, int DIMF){
        this.nombreBanda = nombreBanda;
        this.DIMF = DIMF;
        this.listaTemas = new String[DIMF];
        this.dimL = 0;
        this.finalizado = false;
    }
    
    public void setNombreBanda(String nombreBanda){
        this.nombreBanda = nombreBanda;
    }
    public String getNombreBanda(){
        return this.nombreBanda;
    }
    
    public void agregarTema(String tema){
        if(this.dimL<this.DIMF){
            this.listaTemas[dimL] = tema;
            this.dimL++;
        }
    }
    
    public String getTema(int dimL){
        String result = "ZZZ";
        if(dimL>=0 && dimL <this.DIMF)
            result = this.listaTemas[dimL];
        return result;
    }
    
    public String actuar(){
        String result = "Y ahora tocaremos los siguientes temas: ";
        for(int i=0;i<this.dimL;i++){
            result+= this.listaTemas[i] + "\n";
        }
        return result;
    }
    
    public void finalizar(){
        this.finalizado = true;
    }
    
    public boolean finalizado(){
        return this.finalizado;
    }
    
    public abstract double calcularCosto();
}
