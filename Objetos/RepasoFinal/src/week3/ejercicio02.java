/*
2- A – Definir una clase para representar balanzas comerciales (para ser utilizadas en
verdulerías, carnicerías, etc). Una balanza comercial sólo mantiene el monto y la cantidad
de items correspondientes a la compra actual (es decir, no almacena los ítems de la
compra). La balanza debe responder a los siguientes mensajes:
▪ iniciarCompra(): inicializa el monto y cantidad de ítems de la compra actual.
▪ registrarProducto(pesoEnKg, precioPorKg): recibe el peso en kg del ítem comprado y
su precio por kg, debiendo realizar las actualizaciones en el estado de la balanza.
▪ devolverMontoAPagar(): retorna el monto de la compra actual.
▪ devolverResumenDeCompra(): retorna un String del siguiente estilo “Total a pagar X
por la compra de Y productos” , donde X es el monto e Y es la cantidad de ítems de la
compra.
B - Genere un programa principal que cree una balanza e inicie una compra. Lea
información desde teclado correspondiente a los ítems comprados (peso en kg y precio
por kg) hasta que se ingresa uno con peso 0. Registre cada producto en la balanza. Al
finalizar, informe el resumen de la compra. 
 */
package week3;
import PaqueteLectura.Lector;


public class ejercicio02 {

    public static void main(String[] args) {
        Balanza unaBalanza;
        double unPrecio;
        double unPeso;
        
        String continua;
        //instanciamos la balanza
        unaBalanza = new Balanza();
        
        continua= "Y";                      //solo a efectos de probar el programa
        
        while(continua.toUpperCase().equals("Y")){
            System.out.println("Bienvenido a tu compra: ");
            System.out.println("Ingrese peso del Item (0 para finalizar): ");
            unPeso = Lector.leerDouble();
            while(unPeso != 0){
                 System.out.println("Ingrese precio del Item: ");
                 unPrecio = Lector.leerDouble();
                 unaBalanza.registrarProducto(unPeso, unPrecio);
                 //vuelvo a leer el siguiente item
                 System.out.println("Ingrese peso del Item (0 para finalizar): ");
                 unPeso = Lector.leerDouble();
            }
            System.out.println(unaBalanza.devolverResumenDeCompra());
            System.out.println();
            System.out.println("Desea inicializar una nueva compra? (Y/N");
            continua = Lector.leerString();
        }
    }
}
