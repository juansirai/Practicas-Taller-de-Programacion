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
public class CompraMayorista extends Compra{
    private int cuit;
    
    public CompraMayorista(int nro, int N, int cuit){
        super(nro, N);
        this.cuit = cuit;
    }
    
    
     public double precioPagar(){
        double resultado = 0;
        for(int i=0; i<super.getDimL();i++)
            resultado+=super.getProducto(i).getPrecioMinorista();
        resultado = resultado * (1-0.21);
        return resultado;
    }
     
     public int getCuit(){
        return this.cuit;
     }
     public String toString(){
         return super.toString()+"\n Precio a pagar: "+this.precioPagar()+" Cuit: "+this.getCuit();
     }
}
