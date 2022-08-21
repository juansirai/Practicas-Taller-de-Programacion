/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package parcial.hoteles;

 import PaqueteLectura.Lector;

public class Main {

 
    public static void main(String[] args) {
        Sistema unSistema;
        Cliente unCliente;
        String nombre;
        int dni;
        int numHab;
        
        unSistema = new Sistema(4, 2);
        
        // ingresamos los clientes
        for(int i=0;i<4;i++){
            for(int j=0;j<2;j++){
                System.out.print("Nombre: ");
                nombre = Lector.leerString();
                System.out.print("DNI: ");
                dni = Lector.leerInt();
                unCliente = new Cliente(nombre, dni);
                System.out.println("Cliente agregado en habitacion: "+unSistema.ingresarCliente(unCliente,i));
            }
        }
        System.out.println(unSistema.toString());
        System.out.println("Numero de habitacion a liberar: ");
        numHab = Lector.leerInt();
        System.out.println(unSistema.liberarHabitaciones(numHab));
        System.out.println(unSistema.toString());
        
      
    }
    
}
