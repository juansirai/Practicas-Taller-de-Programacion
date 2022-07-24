/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package adicionales.ejercicio04;

import PaqueteLectura.GeneradorAleatorio;

public class Paciente {
    private String nombre;
    private double ultResultado;
    private double ultDosis;
    
    public Paciente(String nombre, double ultResultado, double ultDosis){
        this.nombre = nombre;
        this.ultResultado = ultResultado;
        this.ultDosis = ultDosis;
    }
    public Paciente(){
    };
    
    public void setNombre(String nombre){
        this.nombre = nombre;
    }
    public String getNombre(){
        return this.nombre;
    }
    
    public void setUltResultado(double u){
        this.ultResultado = u;
    }
    public double getUltResultado(){
        return this.ultResultado;
    }
    
    public void setUltDosis(double d){
        this.ultDosis = d;
    }
    public double getUltDosis(){
        return this.ultDosis;
    }
    
    public void aplicarDosis(double d){
        this.ultDosis = d;
        GeneradorAleatorio.iniciar();
        this.ultResultado-= GeneradorAleatorio.generarDouble(1);
    }
    
        
}
