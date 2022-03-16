/*
Una balanza comercial sólo mantiene el monto y la cantidad
de items correspondientes a la compra actual (es decir, no almacena los ítems de la
compra). La balanza debe responder a los siguientes mensajes:
▪ iniciarCompra(): inicializa el monto y cantidad de ítems de la compra actual.
▪ registrarProducto(pesoEnKg, precioPorKg): recibe el peso en kg del ítem comprado y
su precio por kg, debiendo realizar las actualizaciones en el estado de la balanza.
▪ devolverMontoAPagar(): retorna el monto de la compra actual.
▪ devolverResumenDeCompra(): retorna un String del siguiente estilo “Total a pagar X
por la compra de Y productos” , donde X es el monto e Y es la cantidad de ítems de la
compra.
 */
package week3;

/**
 *
 * @author juans
 */
public class Balanza {
    double monto;
    int cantItems;
    
    //Constructores de clase
    public Balanza(){
    }
    
    //Metodos
    public void iniciarCompra(){
        this.cantItems = 0;
        this.monto = 0;
    }
    
    public void registrarProducto(double pesoEnKg, double precioPorKg){
        this.monto = pesoEnKg * precioPorKg;
        this.cantItems++;
    }
    
    public double devolverMontoAPagar(){
        return this.monto;
    }
    
    public String devolverResumenDeCompra(){
        String aux = "Total a pagar "+this.monto + " por la compra de " + this.cantItems+" productos";
        return aux;
    }
}
