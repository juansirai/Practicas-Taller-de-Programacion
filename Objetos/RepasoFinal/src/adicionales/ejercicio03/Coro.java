/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package adicionales.ejercicio03;

/**
 *
 * @author juans
 */
public abstract class Coro {
    private Persona director;
    private int cantCoristas;
    private int dimL;
    
    public Coro(Persona director, int cantCoristas){
        this.director = director;
        this.cantCoristas = cantCoristas;
        this.dimL = 0;
    }
    
    public int getCantCoristas(){
        return this.cantCoristas;
    }
    
    public int getDimL(){
        return this.dimL;
    }
    
    public void incDimL(){
        this.dimL++;
    }
    
    public abstract void agregarCorista(Corista c);
    
    public boolean estaLleno(){
        return this.dimL==this.cantCoristas;
    }
    
    public abstract boolean estaBienFormado();
    
    public String toString(){
        String resultado = "El coro posee "+this.dimL+ " coristas, y está dirigido por nuestro director "+this.director.toString()+"\n";
        return resultado;
    }
    
}
