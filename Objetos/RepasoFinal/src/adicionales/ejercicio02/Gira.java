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
public class Gira extends Recital {
    private String nombreGira;
    private Fecha[] vectorFechas;
    private int fechaActual;
    private int dimL;
    private int DIMF;
    
    public Gira(String nombreBanda, int cantTemas, String nombreGira, int cantFechas){
        super(nombreBanda, cantTemas);
        this.nombreGira = nombreGira;
        this.DIMF = cantFechas;
        
        vectorFechas = new Fecha[cantFechas];
        this.dimL = 0;
        this.fechaActual = -1;
    }
    
    public void agregarFecha(Fecha f){
        if(this.dimL<this.DIMF){
            this.vectorFechas[this.dimL]  = f;
            this.dimL++;
        }
    }
    
    public Fecha getFechaActual(){
        return this.vectorFechas[this.fechaActual];
    }
    
    public String actuar(){
        this.fechaActual++;
        String resultado = "Buenas noches "+this.getFechaActual().getCiudad()+"\n";
        resultado += super.actuar();     
        if(this.fechaActual == this.dimL-1)
            super.finalizar();
        return resultado;
    }
    
    public double calcularCosto(){
        return this.dimL * 30000;
    }
}
