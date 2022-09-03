/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package parciales.sorteoSolidario;

/**
 *
 * @author juans
 */
public abstract class SorteoSolidario {
    private double premio;
    private Persona[] bonos;
    private int DIMF;
    private int dimL;
    
    public SorteoSolidario(double premio){
        this.premio = premio;
        this.DIMF = 100;
        this.bonos = new Persona[this.DIMF]; 
        this.dimL = 0;
    }
    
    public int agregarPersona(Persona p){
        //se asume que hay lugar
        int lugar = this.dimL;
        this.bonos[lugar] = p;
        this.dimL ++;
        return lugar;
    }
    
    public Persona obtenerPersona(int B){
        //se supone que B es valido
        return this.bonos[B];
    }
 
    public int getInscriptos(){
        return this.dimL;
    }
    
    public abstract Persona sortear();
}
