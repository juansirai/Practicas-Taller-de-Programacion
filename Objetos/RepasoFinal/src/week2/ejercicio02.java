/*
 Utilizando la clase Persona (ya implementada). Realice un programa que almacene en
un vector 15 personas. La información de cada persona debe leerse de teclado. Luego de
almacenar la información:
 - Informe la cantidad de personas mayores de 65 años.
 - Muestre la representación de la persona con menor DNI.
 */
package week2;

import PaqueteLectura.Lector;

public class ejercicio02 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Persona [] vectorPersona = new Persona[15];
        
        String unNombre;
        int unDNI;
        int unaEdad;
        
        int i;
        
        for (i=0;i<15;i++){
            System.out.println("Carga de persona "+(i+1));
            System.out.println("Nombre: ");unNombre = Lector.leerString();
            System.out.println("DNI:  ");unDNI = Lector.leerInt();
            System.out.println("Edad: ");unaEdad = Lector.leerInt();
            vectorPersona[i] = new Persona(unNombre, unDNI, unaEdad);
        }
        
        
        // Informe la cantidad de personas mayores de 65 años
        int cant = 0;
        for(i=0;i<15;i++){
            if(vectorPersona[i].getEdad() < 65){
                cant++;
            }
        }
        System.out.println("Personas menores a 65: " + cant);
        
        //Muestre la representación de la persona con menor DNI.
        int iMin = -1;
        int minDNI = 99999;
        for(i=0;i<15;i++){
            if(vectorPersona[i].getDNI()<minDNI){
                minDNI = vectorPersona[i].getDNI();
                iMin = i;
            }
        }
        System.out.println("Persona con menor DNI: " + vectorPersona[iMin].toString());
    }
    
}
