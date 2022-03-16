/*
3- A- Definir una clase para representar entrenadores de un club de fútbol. Un entrenador
se caracteriza por su nombre, sueldo básico y la cantidad de campeonatos ganados.
▪ Defina métodos para obtener/modificar el valor de cada atributo.
▪ Defina el método calcularSueldoACobrar que calcula y devuelve el sueldo a cobrar por
el entrenador. El sueldo se compone del sueldo básico, al cual se le adiciona un plus por
campeonatos ganados (5000$ si ha ganado entre 1 y 4 campeonatos; $30.000 si ha
ganado entre 5 y 10 campeonatos; 50.000$ si ha ganado más de 10 campeonatos).
B- Realizar un programa principal que instancie un entrenador, cargándole datos leídos
desde teclado. Pruebe el correcto funcionamiento de cada método implementado.
 */
package week3;

import PaqueteLectura.Lector;

public class ejercicio03 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Entrenador unEntrenador;
        String nombre;
        int campGanados;
        double sueldoBasico;
        
        //instanciamos al entrenador con el constructor nulo
        unEntrenador = new Entrenador();
        System.out.println("Ingrese nombre: "); nombre = Lector.leerString();
        System.out.println("Ingrese SB: "); sueldoBasico = Lector.leerDouble();
        System.out.println("Ingrese Campeonatos ganados: "); campGanados = Lector.leerInt();
        
        //utilizamos los setters correspondientes
        unEntrenador.setCampeonatosGanados(campGanados);
        unEntrenador.setNombre(nombre);
        unEntrenador.setSueldoBasico(sueldoBasico);
        
        //retornamos los valores
        System.out.println("Los valores proporcionados fueron: ");
        System.out.println("Nombre: "+ unEntrenador.getNombre());
        System.out.println("Campeonatos: " + unEntrenador.getCampeonatosGanados());
        System.out.println("Sueldo Basico: " + unEntrenador.getSueldoBasico());
        System.out.println("Sueldo total: " + unEntrenador.calcularSueldoACobrar());
    }
    
}
