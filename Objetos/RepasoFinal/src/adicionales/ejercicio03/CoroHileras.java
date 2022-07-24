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
public class CoroHileras extends Coro{
    private Corista[][] coristas;
    private int cantHileras;
    private int cantPorHilera;
    private int i;
    private int j;
    
    public CoroHileras(Persona director, int cantCoristas, int cantHileras){
        super(director, cantCoristas);
        this.cantHileras = cantHileras;
        this.cantPorHilera = cantCoristas / cantHileras;
        coristas = new Corista[cantPorHilera][cantHileras];
        this.i = 0;
        this.j = 0;
    }
    
    public void agregarCorista(Corista c){
        if(!super.estaLleno()){
            if(this.i<this.cantPorHilera){
                 this.coristas[this.i][this.j] = c;    
                 this.i++;
        }
            else{
                this.i = 0;
                this.j++;
                this.coristas[this.i][this.j] = c; 
                this.i++;
            }
            super.incDimL();
        }
    }
    
    public boolean estaBienFormado(){
        boolean cumple = true;
        int i = 0; // columnas
        int j = 0; // hileras
        Corista prox;
        Corista act = this.coristas[i][j];
       while(j < this.cantHileras && cumple){
           while(i<this.cantPorHilera-1 && cumple){
               act = this.coristas[i][j];
               prox = this.coristas[i+1][j];
               cumple = act.getTonoFundamental() == prox.getTonoFundamental();
               i++;
           }
           i=0;
           j++;
           if(j<this.cantHileras){           
               prox = this.coristas[i][j];
           // como dentro de la misma hilera tienen el mismo tono fundamental, puedo tomar tanto act como prox para comparar entre hileras
               cumple =  act.getTonoFundamental() < prox.getTonoFundamental(); 
           }
       }
        return cumple;
    
    }
    
    public String toString(){
        String resultado = super.toString();
        for(int j=0;j<this.cantHileras;j++){
            for(int i=0;i<this.cantPorHilera;i++){
                resultado+="Fila "+j+" Posicion"+i+" "+this.coristas[i][j].toString()+"\n";
                System.out.println(resultado);
            }
        }
        return resultado;
    }
}
