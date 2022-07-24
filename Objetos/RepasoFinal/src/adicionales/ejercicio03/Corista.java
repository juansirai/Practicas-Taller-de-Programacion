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
public class Corista extends Persona{
    private int tonoFundamental;
    
    public Corista(String nombre, int edad, int dni, int tonoFundamental){
        super(nombre, edad, dni);
        this.tonoFundamental = tonoFundamental;
    }
    
    public int getTonoFundamental(){
        return this.tonoFundamental;
    }
    
    public String toString(){
        String resultado = super.toString()+ " y posee tono fundamental "+this.tonoFundamental;
        return resultado;
    }
}
