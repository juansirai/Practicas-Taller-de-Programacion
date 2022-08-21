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
public class Habitacion {
    private double costoDiario;
    private boolean ocupada;
    private Cliente cliente;
    
    public Habitacion(int piso){
        this.ocupada = false;
        this.costoDiario = 800 + 100 * piso;
    }
    
    public double getCosto(){
        return this.costoDiario;
    }
    public void setCosto(int piso){
        this.costoDiario = 800 + 100*piso;
    }
    
    public boolean estaOcupada(){
        return this.ocupada;
    }
    public void ocupar(Cliente c){
        this.ocupada = true;
        this.cliente = c;
    }
    
    public Cliente getCliente(){
        return this.cliente;
    }
    public Cliente desocupar(){
        Cliente aux = this.cliente;
        this.cliente = null;
        this.ocupada = false;
        return aux;
    }
    
    public String toString(){
        String resultado = "Costo Diario: "+this.getCosto()+" Ocupada: "+this.estaOcupada();
        if(this.estaOcupada())
              resultado+= " Cliente: "+this.getCliente().toString();
        return resultado;
    }
}
