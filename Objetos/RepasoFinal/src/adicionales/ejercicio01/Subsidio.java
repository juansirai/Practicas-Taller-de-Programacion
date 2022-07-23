/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package adicionales.ejercicio01;

/**
 *
 * @author juans
 */
public class Subsidio {
    private String motivo;
    private double monto;
    private boolean otorgado;
    
    public Subsidio(String motivo, double monto){
        this.motivo = motivo;
        this.monto = monto;
        this.otorgado = false;
    }
    
    public double getMonto(){
        return this.monto;
    }
    
    public boolean otorgado(){
        return this.otorgado == true;
    }
    
    public void otorgar(){
        this.otorgado = true;
    }
}
