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
public class LibroImpreso extends Libro{
       private boolean tapaDura;
       
       public LibroImpreso(String titulo, double precio, boolean tapaDura){
           super(titulo, precio);
           this.tapaDura = tapaDura;
       }
       
       public boolean esTapaDura(){
           return this.tapaDura;
       }
       
       @Override
       public double getPrecio(){
           double base = super.getPrecio();
           if(this.esTapaDura())
               base+=50;
           return base;
       }
       
       @Override
       public String toString(){
           String resultado = super.toString();
           return resultado + "\n Precio Final: "+this.getPrecio();
       }
}
