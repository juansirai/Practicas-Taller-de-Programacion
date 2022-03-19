/*
5-A- Definir una clase para representar flotas de micros. Una flota se caracteriza por
conocer a los micros que la componen (a lo sumo 15). Defina un constructor para crear
una flota vacía (sin micros).
Implemente métodos para:
i. devolver si la flota está completa (es decir, si tiene 15 micros o no).
ii. agregar a la flota un micro recibido como parámetro.
iii. eliminar de la flota el micro con patente igual a una recibida como parámetro, y
retornar si la operación fue exitosa.
iv - buscar en la flota un micro con patente igual a una recibida como parámetro y
retornarlo (en caso de no existir dicho micro, retornar null).
v. buscar en la flota un micro con destino igual a uno recibido como parámetro y
retornarlo (en caso de no existir dicho micro, retornar null)

B- Genere un programa que cree una flota vacía. Cargue micros (sin pasajeros) a la flota
con información leída desde teclado (hasta que se ingresa la patente “ZZZ000” o hasta
completar la flota). Luego lea una patente y elimine de la flota el micro con esa patente;
busque el micro con dicha patente para comprobar que ya no está en la flota. Para
finalizar, lea un destino e informe la patente del micro que va a dicho destino.

 */
package week4;

import PaqueteLectura.Lector;

public class ejercicio05 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Flota unaFlota;
        
        Micro unMicro;
        String unaPatente;
        String unDestino;
        int unaHora;
        
        System.out.println("Creamos la flota: ");
        unaFlota = new Flota();
        
        //comienzo a crear micros y agregarlos a la flota
        System.out.println("Ingrese una patente, ZZZ000 para detener: ");
        unaPatente = Lector.leerString();
        while(!unaPatente.equals( "ZZZ000") && !unaFlota.estaCompleta()){
            System.out.println("Ingrese un Destino: ");
            unDestino = Lector.leerString();
            System.out.println("Una hora: ");
            unaHora = Lector.leerInt(); 
            //instanciamos el micro
            unMicro = new Micro(unaPatente, unDestino, unaHora);
            unaFlota.agregarMicro(unMicro);
            System.out.println("Ingrese una patente, ZZZ000 para detener: ");
            unaPatente = Lector.leerString();
        }
        
        System.out.println("Ingrese la patente del micro que desea eliminar: ");
        unaPatente = Lector.leerString();
        unaFlota.eliminarMicro(unaPatente);
        
        System.out.println("Comprobación de eliminación de la patente. La patente se encuentra en la flota? Resultado: " + unaFlota.retornarMicro(unaPatente));
        
        System.out.println("Buscar micro por destino, ingrese un destino: ");
        unDestino = Lector.leerString();
        unMicro = unaFlota.buscarPorDestino(unDestino);
        if(unMicro != null) System.out.println(unMicro.getPatente());
        else System.out.println("No se encontro el micro");
        
    }
    
}
