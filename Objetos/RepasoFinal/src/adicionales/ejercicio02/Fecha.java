/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package adicionales.ejercicio02;

/**
 *
 * @author juans
 */
public class Fecha {
    private String dia;
    private String ciudad;

    public Fecha(String dia, String ciudad) {
        this.dia = dia;
        this.ciudad = ciudad;
    }
    
    public void setDia(String dia){
        this.dia = dia;
    }
    public String getDia(){
        return this.dia;
    }
    
    public void setCiudad(String ciudad){
        this.ciudad = ciudad;
    }
    public String getCiudad(){
        return this.ciudad;
    }
    
}
