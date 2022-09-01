/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package parciales.sistemaCompras;

/**
 *
 * @author juans
 */
public class Producto {
    private int codigo;
    private double precioMayorista;
    private double precioMinorista;
   
    public Producto(int codigo, double precioM, double precioMin){
        this.codigo = codigo;
        this.precioMayorista = precioM;
        this.precioMinorista = precioMin;
    }
    
    public double getPrecioMinorista(){
        return this.precioMinorista;
    }
    public double getPrecioMayorista(){
        return this.precioMayorista;
    }
    
    public int getCodigo(){
        return this.codigo;
    }
    
    public String toString(){
        return "Codigo: "+this.getCodigo()+ " Precio Mayorista: "+this.getPrecioMayorista()+" Precio Minorista: "+this.getPrecioMinorista();
    }

}
