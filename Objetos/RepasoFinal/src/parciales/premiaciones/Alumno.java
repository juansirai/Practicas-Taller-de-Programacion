/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package parciales.premiaciones;

/**
 *
 * @author juans
 */
public class Alumno {
    private String nombre;
    private double promedio;
    private int anioIngreso;
    private int anioEgreso;
    
    public Alumno(String nombre, double promedio, int anioI, int anioE){
        this.nombre = nombre;
        this.promedio = promedio;
        this.anioIngreso = anioI;
        this.anioEgreso = anioE;
    } 
    
    // Setters y getters de atributos
    public void setNombre(String nombre){
        this.nombre = nombre;
    }
    public String getNombre(){
        return this.nombre;
    }
    
    public void setPromedio(double promedio){
        this.promedio = promedio;
    }
    public double getPromedio(){
        return this.promedio;
    }
    
    public void setAnioI(int anio){
        this.anioIngreso = anio;
    }
    public int getAnioI(){
        return this.anioIngreso;
    }
    
    public void setAnioE(int anio){
        this.anioEgreso = anio;
    }
    public int getAnioE(){
        return this.anioEgreso;
    }
   
    public int aniosGraduacion(){
        return this.anioEgreso - this.anioIngreso;
    }
}
