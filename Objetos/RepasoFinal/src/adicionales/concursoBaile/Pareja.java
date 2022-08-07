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
public class Pareja {
    Participante[] integrantes;
    int DIMF = 2;
    int dimL;
    String estilo;
    
    public Pareja(Participante p1, Participante p2, String stilo){
        this.integrantes = new Participante[this.DIMF];
        this.estilo = stilo;
        this.integrantes[1] = p1;
        this.integrantes[2] = p2;
        this.dimL = 2;
    }
    
    public Pareja(){
        this.integrantes = new Participante[this.DIMF];
        this.dimL = 0;
    }
    
    public boolean hayLugar(){
        return this.dimL<this.DIMF;
    }
    
    public void setParticipante(Participante p){
        if(this.hayLugar()){
            this.integrantes[this.dimL] = p;
            this.dimL++;
        }
    }
    
    public int getDifEdad(){
        int diferencia = -1;
        if(!this.hayLugar()){
            diferencia = this.integrantes[0].getEdad()-this.integrantes[1].getEdad();
            if(diferencia<0)
                diferencia = diferencia * -1;
        }
        return diferencia;
    }
    
    public String toString(){
        String resultado= "";
        if(!this.hayLugar()){
            for(int i=0; i<2;i++){
                resultado+="Integrante "+i+"\n"+this.integrantes[i].toString();
            }
        }
        return resultado;
    }
    
}
