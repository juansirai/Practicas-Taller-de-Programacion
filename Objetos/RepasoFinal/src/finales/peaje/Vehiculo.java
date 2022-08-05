/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package finales.peaje;

/**
 *
 * @author juans
 */
public class Vehiculo {
    private boolean viajaSolo;
    private double montoAbonado;
    
    public Vehiculo(){};
    public Vehiculo(boolean viajaSolo, double montoAbonado){
        this.viajaSolo = viajaSolo;
        this.montoAbonado = montoAbonado;
    }

    public void setViajaSolo(boolean viajaSolo) {
        this.viajaSolo = viajaSolo;
    }

    public void setMontoAbonado(double montoAbonado) {
        this.montoAbonado = montoAbonado;
    }

    public boolean isViajaSolo() {
        return viajaSolo;
    }

    public double getMontoAbonado() {
        return montoAbonado;
    }
    
    
}
