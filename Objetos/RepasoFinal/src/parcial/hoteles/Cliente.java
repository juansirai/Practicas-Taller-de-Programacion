/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package parcial.hoteles;

/**
 *
 * @author juans
 */
public class Cliente {
    private String nombre;
    private int dni;
    
    public Cliente(){};
    public Cliente(String nombre, int DNI){
        this.nombre = nombre;
        this.dni = DNI;
    }
    
    public void setNombre(String nombre){
        this.nombre = nombre;
    }
    public String getNombre(){
        return this.nombre;
    }
    
    public void setDNI(int dni){
        this.dni = dni;
    }
    public int getDNI(){
        return this.dni;
    }
    
    public String toString(){
        return "Cliente "+this.getNombre()+" DNI: "+this.getDNI();
    }
}
