/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package week1;
import PaqueteLectura.GeneradorAleatorio;
/**
 5- Un edificio de oficinas está conformado por 8 pisos y 4 oficinas por piso. Realice
un programa que permita informar la cantidad de personas que concurrieron a
cada oficina de cada piso. Para esto, simule la llegada de personas al edificio de la
siguiente manera: a cada persona se le pide el nro. de piso y nro. de oficina a la cual
quiere concurrir. La llegada de personas finaliza al indicar un nro. de piso 9. Al
finalizar la llegada de personas, informe lo pedido. 
 */
public class ejercicio5 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        int maxPisos = 9; /*no considero a planta baja (0) como piso*/
        int maxOficinas = 4;
        int [][] edificio;
        
        int piso; int oficina;
        int unPiso;
        int unaOficina;
        
        /*instanciamos la matriz de oficinas*/
        edificio = new int[maxPisos][maxOficinas];
        
        /*inicializamos la matriz*/
        for(piso = 0;piso< maxPisos;piso++){
            for(oficina = 0; oficina< maxOficinas; oficina++){
                edificio[piso][oficina] = 0;
            }
        }
        
        /*comenzamos a solicitar de manera aleatoria el ingreso de piso + oficina*/
        GeneradorAleatorio.iniciar();                             
        unPiso = GeneradorAleatorio.generarInt(10); /* Genera un int entre 0 y 9*/
        while (unPiso != 9 ){
            unaOficina = GeneradorAleatorio.generarInt(4); /*Genera un int de 0 a 3*/
            edificio[unPiso][unaOficina] = edificio[unPiso][unaOficina] +1 ;
            unPiso =  GeneradorAleatorio.generarInt(10);
            
        }
        
        System.out.println(" A continuacion se informa la cantidad de personas por piso: ");
        
        for(piso = 0;piso<maxPisos; piso++){
             System.out.println("Piso "+ (piso+1));
            for(oficina =0; oficina < maxOficinas; oficina++){
                System.out.print("  Oficina "+ (oficina+1) + ": " + edificio[piso][oficina]);
            }
            System.out.println();
        }
        
    }
    
}
