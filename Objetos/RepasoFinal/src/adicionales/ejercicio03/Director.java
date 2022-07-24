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
public class Director extends Persona{
    private int antiguedad;
    
    public Director(String nombre, int edad, int dni, int antiguedad ){
        super(nombre, edad, dni);
        this.antiguedad = antiguedad;
    }
    
    public String toString(){
        String resultado = super.toString()+" y "+this.antiguedad+" anios de antiguedad";
        return resultado;
    }
    
}
