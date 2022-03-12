/*
 Realice un programa que cargue un vector con 10 strings leídos desde teclado. El vector
generado tiene un mensaje escondido que se forma a partir de la primera letra de cada
string. Muestre el mensaje escondido en consola.
NOTA: La primera letra de un string se obtiene enviándole el mensaje charAt(0) al objeto
string. Probar con: humo oso lejos ala menos usado nene de ocho ! Debería imprimir:
holamundo!

 */
package week2;

import PaqueteLectura.Lector;

public class ejercicio05 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        String [] vector = new String[10];
        
        //generamos el string
        int i;
        for (i=0;i<10;i++){
            vector[i] = Lector.leerString();
        }
        
        //imprimimos el mensaje:
        for (i=0;i<10;i++){
            System.out.print(vector[i].charAt(0));
        }
    }
    
}
