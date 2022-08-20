/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package finales.psicologo;

/**
 *
 * @author juans
 */
public class Paciente {
    private String nombre;
    private boolean obraSocial;
    private double costoSesion;
    
    public Paciente(String nombre, boolean obraSocial, double costoSesion){
        this.nombre = nombre;
        this.obraSocial = obraSocial;
        this.costoSesion = costoSesion;
    }
    
    public void setNombre(String nombre){
        this.nombre = nombre;
    }
    public String getNombre(){
        return this.nombre;
    }
    
    public void setTieneOS(boolean obraSocial){
        this.obraSocial = obraSocial;
    }
    public boolean tieneObraSocial(){
        return this.obraSocial;
    }
    
    public void setCosto(double costo){
        this.costoSesion = costo;
    }
    public double getCostoSesion(){
        return this.costoSesion;
    }
    
    public String toString(){
        return "Nombre "+this.getNombre()+" Obra Social: "+this.tieneObraSocial()+" Costo: "+this.getCostoSesion();
    }
}
