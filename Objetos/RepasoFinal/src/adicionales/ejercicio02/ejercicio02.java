/*
d) Realice un programa que instancie un evento ocasional. Lea desde el teclado el día del
evento, el nombre de quien lo contrata, el motivo, la banda y el listado de temas a tocar.
Luego imprima el costo del evento e invoque el mensaje actuar del evento.
A continuación instancie una gira, leyendo desde el teclado el nombre de la gira, la banda,
el listado de temas y el listado de ciudades con sus correspondientes días. Luego imprima
el costo de la gira e invoque al mensaje actuar de la misma hasta finalizar la gira.
 */
package adicionales.ejercicio02;

import PaqueteLectura.Lector;

public class ejercicio02 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Evento unEvento;
        String diaEvento;
        String contratante;
        String motivo;
        String banda;
        int cantCanciones;
        String cancion;
        
        Gira unaGira;
        int cantTemas;
        String nombreGira;
        int cantFechas;
        Fecha unaFecha;
        String ciudad;
        String dia;
        
        System.out.println("Vamos a instanciar el evento ocasional: ");
        System.out.println("Banda: ");
        banda = Lector.leerString();
        System.out.println("Contratante: ");
        contratante = Lector.leerString();
        System.out.println("Motivo: ");
        motivo = Lector.leerString();
        System.out.println("Fecha evento: ");
        diaEvento = Lector.leerString();
        System.out.println("Cantidad de canciones: ");
        cantCanciones = Lector.leerInt();
        
        unEvento = new Evento(motivo, contratante, diaEvento ,banda,cantCanciones);
        for(int i=0;i<cantCanciones;i++){
            System.out.println("Cancion "+i+": ");
            cancion = Lector.leerString();
            unEvento.agregarTema(cancion);
        }
        
        System.out.println("El costo del evento es: "+unEvento.calcularCosto());
        System.out.println("Vamos a actuar! ");
        System.out.println(unEvento.actuar());
    
        // instanciamos la gira
         System.out.println("Vamos a instanciar la gira: ");
         System.out.println("Nombre gira: ");
         nombreGira = Lector.leerString();
         System.out.println("Nombre banda: ");
         banda = Lector.leerString();
         cantTemas = Lector.leerInt();
         cantFechas = Lector.leerInt();
         
         unaGira = new Gira(banda, cantTemas, nombreGira, cantFechas);
         for(int i=0;i<cantTemas;i++){
            System.out.println("Tema "+i+": ");
            cancion = Lector.leerString();
            unaGira.agregarTema(cancion);
        }
         
         for(int i=0;i<cantFechas;i++){
             System.out.println("Fecha: "+i);
             System.out.println("Ciudad: ");
             ciudad = Lector.leerString();
             System.out.println("Dia: ");
             dia = Lector.leerString();
             unaFecha = new Fecha(dia, ciudad);
             unaGira.agregarFecha(unaFecha);
         }
         
         System.out.println("El costo de la gira es: "+unaGira.calcularCosto());
         System.out.println("Vamos a actuar: ");
         for(int i=0;i<cantFechas;i++){
             System.out.println(unaGira.actuar());
         }
         
    }
    
 }
    

