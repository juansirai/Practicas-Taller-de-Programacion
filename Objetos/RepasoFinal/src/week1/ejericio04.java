/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package week1;
import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;

public class ejericio04 {

    /**
    Escriba un programa que defina una matriz de enteros de tamaño 10x10.
Inicialice la matriz con números aleatorios entre 0 y 200.
Luego realice las siguientes operaciones:
- Mostrar el contenido de la matriz en consola.
- Calcular e informar la suma de todos los elementos almacenados entre las
filas 2 y 9 y las columnas 0 y 3
- Generar un vector de 10 posiciones donde cada posición i contiene la suma
de los elementos de la columna i de la matriz.
- Lea un valor entero e indique si se encuentra o no en la matriz. En caso de
encontrarse indique su ubicación (fila y columna) en caso contrario
imprima “No se encontró el elemento”.
     */
    public static void main(String[] args) {
        int [][] matriz = new int [10][10];
        int i; int j;
        int suma;
        int numero;
        
        for (i=0; i<10;i++){
            for(j=0;j<10;j++){
                matriz[i][j] = GeneradorAleatorio.generarInt(200);
            }
        }
        
        /*Imprimimos el contenido de la matriz*/
        for(i=0; i<10;i++){
            for(j=0;j<10;j++){
                System.out.print("[ "+matriz[i][j]+" ]");
            }
            System.out.println();
        }
        
        /*Calculamos la suma de los elementos entre filas 2 y 9 y columnas 0 y 3*/
        suma = 0;
        for(i=2;i<=9;i++){
            for(j=0;j<=3;j++){
                suma = suma + matriz[i][j];
            }
        }
        
        System.out.println("La suma es: "+suma);
        
        /*Buscamos un elemento*/
        
        System.out.print("Ingrese un numero: ");
        numero = Lector.leerInt();
        i = 0; j=0;
        boolean encontre = false;
        while(i<10 && !encontre){
            j=0;
            while(j<10 && !encontre){
                encontre = matriz[i][j] == numero;
                if(!encontre) j++;
            }
            if(!encontre) i++;
        }
        
        if(encontre) System.out.println("El numero esta en posicion ["+i+"] [" + j + "]");
        else System.out.println("El numero no se encuentra");
    }
    
}
