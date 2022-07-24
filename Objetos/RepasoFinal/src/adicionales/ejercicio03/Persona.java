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
public abstract class Persona {
    private String nombre;
    private int edad;
    private int dni;
    
    public Persona(String nombre, int edad, int dni){
        this.nombre = nombre;
        this.edad = edad;
        this.dni = dni;
    }
    
    public String toString(){
        return this.nombre+" de "+this.edad+" anios de edad y dni "+this.dni;
     }  
}
