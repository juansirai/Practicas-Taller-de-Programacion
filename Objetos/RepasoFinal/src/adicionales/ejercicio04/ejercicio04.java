/*
Realice un programa que instancie un Grupo Alfa y un Grupo Beta. Llene cada grupo con
pacientes (el primero con 3 y el segundo con 4). Aplique una dosis D de fármaco (leída por
teclado) a los pacientes de cada grupo. Imprima la representación string de cada grupo.
 */
package adicionales.ejercicio04;

import PaqueteLectura.Lector;

public class ejercicio04 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        
        GrupoAlfa unGA;
        GrupoBeta unGB;
        Paciente unPaciente;
        String nombre;
        double ultResultado;
        double ultDosis;
        
        //instanciamos grupo alfa
        unGA = new GrupoAlfa();
        for(int i=0;i<3;i++){
            System.out.println("Paciente: "+(i+1));
            System.out.println("Nombre: ");
            nombre = Lector.leerString();
            System.out.println("Ultimo Resultado ");
            ultResultado = Lector.leerDouble();
            System.out.println("Ultima Dosis: ");
            ultDosis = Lector.leerDouble();
            unPaciente = new Paciente(nombre, ultResultado, ultDosis);
            unGA.agregarPaciente(unPaciente);
        }
        //instanciamos grupo beta
        unGB = new GrupoBeta();
        for(int i=0;i<4;i++){
            System.out.println("Paciente: "+(i+1));
            System.out.println("Nombre: ");
            nombre = Lector.leerString();
            System.out.println("Ultimo Resultado ");
            ultResultado = Lector.leerDouble();
            System.out.println("Ultima Dosis: ");
            ultDosis = Lector.leerDouble();
            unPaciente = new Paciente(nombre, ultResultado, ultDosis);
            unGB.agregarPaciente(unPaciente);
        }
        
        System.out.println("Imprimimos GA \n");
        System.out.println(unGA.toString());
        System.out.println("Imprimimos GB \n");
        System.out.println(unGB.toString());
        
        System.out.println("Aplicamos la dosis: ");
        double dosis = Lector.leerDouble();
        unGA.aplicarDosis(dosis);
        unGB.aplicarDosis(dosis);
        
        System.out.println("Imprimimos GA \n");
        System.out.println(unGA.toString());
        System.out.println("Imprimimos GB \n");
        System.out.println(unGB.toString());
        
    }
    
}
