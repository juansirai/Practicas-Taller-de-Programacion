/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package adicionales.concursoBaile;

/**
 *
 * @author juans
 */
public class Concurso {
    private Pareja[] parejas;
    private int DIMF;
    private int dimL;
    
    public Concurso(int N){
        this.parejas = new Pareja[N];
        this.dimL = 0;
        this.DIMF = N;
    }
    
    public boolean hayLugar(){
        return this.dimL < this.DIMF;
    }
    
    public void agregarPareja(Pareja p){
        if(this.hayLugar()){
            this.parejas[this.dimL] = p;
            this.dimL++;
        }
    }
    
    public Pareja mayorDifEdad(){
        Pareja resultado = null;
        int max = -1;
        for(int i=0; i<this.dimL; i++){
            if(this.parejas[i].getDifEdad()>max){
                max = this.parejas[i].getDifEdad();
                resultado = this.parejas[i];
            }
        }
        return resultado;
    }
    
    public int cantParejas(){
        return this.dimL;
    }
}
