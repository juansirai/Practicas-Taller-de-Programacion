/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package finales.libros;

/**
 *
 * @author juans
 */
public class LibroElectronico extends Libro{
    private String formato;
    private int tamanio;
    
    public LibroElectronico(String titulo, double precio, String formato, int tamanio){
        super(titulo, precio);
        this.formato = formato;
        this.tamanio = tamanio;
    }
    
    public int getTamanio(){
        return this.tamanio;
    }
    
    @Override
    public double getPrecio(){
        double base = super.getPrecio();
        return base + 2.5 * this.getTamanio();
    }
    
    @Override
    public String toString(){
        String resultado = super.toString();
        return resultado + "\n Precio Final: "+this.getPrecio();
    }
    
}
