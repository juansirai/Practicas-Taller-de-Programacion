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
public class Persona {
    private String nombre;
    private int dni;
    private double colaboracion;
    
    public Persona(String nombre, int dni, double colaboracion){
        this.nombre = nombre;
        this.dni = dni;
        this.colaboracion = colaboracion;
    }
    
    public double getColaboracion(){
        return this.colaboracion;
    }
   
    @Override
    public String toString(){
        return "Nombre: "+this.nombre+" DNI: "+this.dni + " Colaboracion: "+this.colaboracion;
    }

}
