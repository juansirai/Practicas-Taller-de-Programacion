/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package finales.peaje;


import PaqueteLectura.Lector;
import PaqueteLectura.GeneradorAleatorio;

public class Sistema {
    private Ventanilla[] ventanillas;
    private int DIMF = 8;
    
    public Sistema(){
        this.ventanillas = new Ventanilla[this.DIMF+1];
        for(int i=1; i<this.DIMF+1;i++){
            this.ventanillas[i] = new Ventanilla();
        }
    }
    
    public void registrar(){
        int i;
        boolean solo;
        double monto;
        Vehiculo v = new Vehiculo();
        System.out.println("Numero ventanilla (1..8");
        i = Lector.leerInt();
        if(i>0 && i<9){
            System.out.println("Viaja solo conductor? (true/false)");
            solo = Lector.leerBoolean(); 
            System.out.println("Monto abonado: ");
            monto = Lector.leerDouble();
            v.setMontoAbonado(monto);
            v.setViajaSolo(solo);
            this.ventanillas[i].pasarVehiculo(v);
        }
        else
            System.out.println("Ventanilla no existe");  
    }
    
        public void registrarAleatorio(){
        int i;
        boolean solo;
        double monto;
        Vehiculo v = new Vehiculo();
        i = GeneradorAleatorio.generarInt(7)+1;
        System.out.println("Numero ventanilla " + i);        
        System.out.println(i);
        if(i>0 && i<9){
            solo = GeneradorAleatorio.generarBoolean();
            System.out.println("Viaja solo conductor? (true/false)" + solo);
            monto = GeneradorAleatorio.generarDouble(9999);
            System.out.println("Monto abonado: " + monto);
            v.setMontoAbonado(monto);
            v.setViajaSolo(solo);
            this.ventanillas[i].pasarVehiculo(v);
        }
        else
            System.out.println("Ventanilla no existe");  
    }
    
    public int ventanillaMenorRecaudacion(){
        double min = 99999;
        int iMin = -1;
        for(int i=1;i<=this.DIMF;i++)
            if(this.ventanillas[i].getMontoPromedio()<min){
                iMin = i;
                min = this.ventanillas[i].getMontoPromedio();
            }
        return iMin;
    }
    
    public String reporteVentanillas(){
        String resultado = "Reporte ventanillas \n";
        for(int i=1; i<=this.DIMF;i++){
            resultado +="ventanilla "+i+": "+this.ventanillas[i].toString()+"\n";
        }
        return resultado;
    }
}
