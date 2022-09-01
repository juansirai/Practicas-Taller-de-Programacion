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
public abstract class Compra {
    private int nro;
    private Producto[] productos;
    private int N;
    private int dimL;
    
    public Compra(int nro, int N){
        this.nro = nro;
        this.N = N;
        this.productos = new Producto[N];
        this.dimL = 0;
    }
    
    public void agregarProducto(Producto p){
        //se asume que hay espacio
        this.productos[this.dimL] = p;
        this.dimL ++;
    }
    
    public abstract double precioPagar();
    
    public int getDimL(){
        return this.dimL;
    }
    
    public Producto getProducto(int i){
        Producto p= null;
        if(i>=0 && i<this.dimL)
             p = productos[i];
        return p;
    }
    
    public int getNro(){
        return this.nro;
    }
    
    public String toString(){
        String resultado = "Nro: "+this.getNro()+" Productos: ";
        for(int i=0; i<this.getDimL();i++)
                resultado+=this.productos[i].toString();
        return resultado;
    }
}
