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
public class CompraMinorista extends Compra{
    private boolean jubilado;
    
    public CompraMinorista(int nro,int N, boolean jubilado){
        super(nro, N);
        this.jubilado = jubilado;
    }
    
    public double precioPagar(){
        double resultado = 0;
        for(int i=0; i<super.getDimL();i++)
            resultado+=super.getProducto(i).getPrecioMinorista();
       if(this.esJubilado())
           resultado = resultado * (1-0.1);
        return resultado;
    }
    
    public boolean esJubilado(){
        return this.jubilado;
    }
 
    public String toString(){
        String resultado = super.toString() + " \n Precio a pagar: "+this.precioPagar()+ " Es jubilado: "+this.esJubilado();
        return resultado;
    }
}
