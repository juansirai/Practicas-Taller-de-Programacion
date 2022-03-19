/*
4-A- Definir una clase para representar micros. Un micro conoce su patente, destino, hora
salida, el estado de sus 20 asientos (es decir si está o no ocupado) y la cantidad de asientos
ocupados al momento. Lea detenidamente a) y b) y luego implemente.
a) Implemente un constructor que permita iniciar el micro con una patente, un destino y
una hora de salida (recibidas por parámetro) y sin pasajeros.
b) Implemente métodos para:
i. devolver/modificar patente, destino y hora de salida
ii. devolver la cantidad de asientos ocupados
iii. devolver si el micro está lleno
iv. validar un número de asiento recibido como parámetro (es decir, devolver si está
en rango o no)
v. devolver el estado de un nro. de asiento válido recibido como parámetro
vi. ocupar un nro. de asiento válido recibido como parámetro
vii. liberar un nro. de asiento válido recibido como parámetro
viii. devolver el nro. del primer asiento libre
B- Realice un programa que cree un micro con patente “ABC123”, destino “Mar del Plata” y
hora de salida 5:00. Cargue pasajeros al micro de la siguiente manera. Leer nros. de
asientos desde teclado que corresponden a pedidos de personas. La lectura finaliza cuando
se ingresa el nro. de asiento -1 o cuando se llenó el micro. Para cada nro. de asiento leído
debe: validar el nro; en caso que esté libre, ocuparlo e informar a la persona el éxito de la
operación; en caso que esté ocupado informar a la persona la situación y mostrar el nro.
del primer asiento libre. Al finalizar, informe la cantidad de asientos ocupados del micro. 
 */
package week4;

import PaqueteLectura.Lector;

public class ejercicio04 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Micro unMicro;
        
        String unaPatente;
        String unDestino;
        int unaHora;
        int unAsiento;
        
        //instanciamos el micro
        System.out.println("Ingrese patente: ");
        unaPatente = Lector.leerString();
        System.out.println("Ingrese Destino: ");
        unDestino = Lector.leerString();
        System.out.println("Ingrese hora de salida: ");
        unaHora = Lector.leerInt();
        unMicro = new Micro(unaPatente, unDestino, unaHora);
        
        System.out.println("Comienza la carga de asientos, por favor ingrese un numero: ");
        unAsiento = Lector.leerInt();
        while(unAsiento != -1 && !unMicro.estaLleno()){
            if(unMicro.asientoValido(unAsiento) && !unMicro.estado(unAsiento)){
                unMicro.ocuparAsiento(unAsiento);
                System.out.println("El asiento se ocupó con exito.");
            }
            else if (unMicro.asientoValido(unAsiento)) System.out.println("El asiento esta ocupado");
            else System.out.println("El asiento no es valido.");
            System.out.println("Ingrese un numero de asiento: ");
            unAsiento = Lector.leerInt(); 
        }
        System.out.println("-----------------------------");
        System.out.println("La carga ha finalizado, total de asientos ocupados: " + unMicro.getOcupacion());
        
    }
    
}
