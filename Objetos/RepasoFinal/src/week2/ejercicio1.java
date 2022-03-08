/*
 Realice un programa que cree un objeto persona con datos leídos desde teclado. Luego
muestre en consola la representación de ese objeto en formato String
 */
package week2;
import PaqueteLectura.Lector;
/**
 *
 * @author juans
 */
public class ejercicio1 {

    public static void main(String[] args) {
        Persona unaPersona;
        int unaEdad;
        int unDNI;
        String unNombre;
        
        /*Leo los datos de la persona*/
        System.out.println("Ingrese un nombre: ");
        unNombre = Lector.leerString();
        System.out.println("Ingrese una edad: "); unaEdad = Lector.leerInt();
        System.out.println("Ingrese un DNI: "); unDNI = Lector.leerInt();
        
        
        /*Instanciamos el objeto*/
        unaPersona = new Persona(unNombre, unDNI, unaEdad);
        System.out.println(unaPersona.toString());
    }
    
}
