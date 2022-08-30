/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package parciales.concursoMusica;

/**
 *
 * @author juans
 */
public class Alumno {
    private String nombre;
    private int edad;
    private String instrumento;
    private double puntaje;
    

    public Alumno(String nombre, int edad, String instrumento, double puntaje){
        this.nombre = nombre;
        this.edad = edad;
        this.instrumento = instrumento;
        this.puntaje = puntaje;
    }
    
    public String getNombre(){
        return this.nombre;
    }
    public void setNombre(String n){
        this.nombre = n;
    }
    
    public int getEdad(){
        return this.edad;
    }
    public void setEdad(int e){
        this.edad = e;
    }
    
    public String instrumento(){
        return this.instrumento;
    }
    public void setInstrumento(String i){
        this.instrumento = i;
    }
    
    public double getPuntaje(){
        return this.puntaje;
    }
    public void setPuntaje(double p){
        this.puntaje = p;
    }
}
