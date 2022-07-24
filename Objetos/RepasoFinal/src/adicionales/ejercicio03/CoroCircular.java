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
public class CoroCircular extends Coro{
    private Corista[] coristas;
    
    public CoroCircular(Persona director, int cantCoristas){
        super(director, cantCoristas);
        this.coristas = new Corista[cantCoristas];
    }
    
    public void agregarCorista(Corista c){
        if(super.getDimL()<super.getCantCoristas()){
            this.coristas[super.getDimL()] = c;
            super.incDimL();
        }
      }
    
    public boolean estaBienFormado(){
        boolean cumple = true;
        int i = 0;
        while(cumple && i < this.getCantCoristas()-1){
            int j = i+1;
            cumple = this.coristas[i].getTonoFundamental()<this.coristas[j].getTonoFundamental();
            i++;
        }
        return cumple;
    }
    
    public String toString(){
        String resultado = super.toString()+"Y a continuacion nuestros coristas: "+"\n";
        for(int i=0;i<this.getDimL();i++){
            resultado+="Posicion "+i+": "+this.coristas[i].toString()+"\n";
        }
        return resultado;
    }
    
}
