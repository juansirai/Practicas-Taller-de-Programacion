/*
4- Se realizará un casting para un programa de TV. El casting durará a lo sumo 5 días y en
cada día se entrevistarán a 8 personas en distinto turno.
a) Simular el proceso de inscripción de personas al casting. A cada persona se le pide
nombre, DNI y edad y se la debe asignar en un día y turno de la siguiente manera: las
personas primero completan el primer día en turnos sucesivos, luego el segundo día y así
siguiendo. La inscripción finaliza al llegar una persona con nombre “ZZZ” o al cubrirse los
40 cupos de casting.
Una vez finalizada la inscripción:
b) Informar para cada día y turno el nombre de la persona a entrevistar.
NOTA: utilizar la clase Persona y pensar en la estructura de datos a utilizar.
 */
package week2;

import PaqueteLectura.GeneradorAleatorio;

public class ejercicio04 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Persona[][] matrizCasting;
        int MAXDIAS = 5;
        int MAXPERSONAS = 8;
        
        int unDNI;
        int unaEdad;
        String unNombre;
        
        int i; int j;
        int dimL = 0;
        
        // Instanciamos la matriz del casting
        matrizCasting = new Persona[MAXDIAS][MAXPERSONAS];
        
        unNombre = GeneradorAleatorio.generarString(3).toUpperCase();
        unDNI = GeneradorAleatorio.generarInt(2000);
        unaEdad = GeneradorAleatorio.generarInt(70);
       
        i = 0;
        while(dimL < 40 &&    !unNombre.equals("ZZZ") && i< MAXDIAS ){
                j = 0;
                while(dimL <40 && j<MAXPERSONAS  && !unNombre.equals("ZZZ")){
                    matrizCasting[i][j] = new Persona(unNombre, unDNI, unaEdad);
                    j ++;
                    dimL ++;
                    
                    unDNI = GeneradorAleatorio.generarInt(2000);
                    unaEdad = GeneradorAleatorio.generarInt(70);
                    unNombre = GeneradorAleatorio.generarString(3).toUpperCase();
                }
                i++;
        }
        
        //Informar para cada día y turno el nombre de la persona a entrevistar.
        i = 0;j=0;
        for(i=0;i<5;i++){
            System.out.println("Personas en día: "+ (i+1));
            for(j=0;j<8;j++){
                System.out.println((j+1) + ": " + matrizCasting[i][j].toString());
            }
        }
        
    }
    
}
