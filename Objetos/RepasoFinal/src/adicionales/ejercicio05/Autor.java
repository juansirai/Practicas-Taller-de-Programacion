/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package adicionales.ejercicio05;

/**
 *
 * @author juans
 */
public class Autor {
    private String nombre;
    private String biografia;
    
    public Autor(String a, String b){
        this.nombre = a;
        this.biografia = b;
    }
    
    public void setNombre(String a){
        this.nombre = a;
    }
    public String getNombre(){
        return this.nombre;
    }
    
    public void setBiografia(String b){
        this.biografia = b;
    }
    public String getBiografia(){
        return this.biografia;
    }
}
