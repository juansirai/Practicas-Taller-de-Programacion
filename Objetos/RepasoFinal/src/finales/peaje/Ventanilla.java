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
public class Ventanilla {
    private int cantVehiculos;
    private int cantSoloConductor;
    private double montoTotal;
    
    
    public Ventanilla(){
        this.cantVehiculos = 0;
        this.cantSoloConductor = 0;
        this.montoTotal = 0;
    }
    
    public void pasarVehiculo(Vehiculo v){
        /* como el enunciado no especifica, no nos quedamos con el dato puntual de cada vehiculo
           sino que registramos el paso mediante la actualizacion de las variables de instancia.
        */
        this.cantVehiculos++;
        this.montoTotal+=v.getMontoAbonado();
        if(v.isViajaSolo())
            this.cantSoloConductor++;
    }

    public int getCantVehiculos() {
        return cantVehiculos;
    }

    public int getCantSoloConductor() {
        return cantSoloConductor;
    }

    public double getMontoTotal() {
        return montoTotal;
    }

    public double getMontoPromedio() {
        double promedio = 0;
        if(this.getCantVehiculos()>0)
            promedio = this.montoTotal/this.cantVehiculos;
        return promedio;
    }
    
    public String toString(){
        return "Cantidad de vehiculos: "+this.getCantVehiculos() + " ( solo conductor en "+this.getCantSoloConductor()+") Monto total: "+this.getMontoTotal()+ "| monto promedio: "+this.getMontoPromedio();
    }
    
}
