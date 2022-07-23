/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package adicionales.ejercicio01;

import PaqueteLectura.Lector;

public class Ejercicio01 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
       Proyecto unProyecto;
       Subsidio unSubsidio;
       Investigador unInvestigador1;
       Investigador unInvestigador2;
       String nombre;
       int categoria;
       String especialidad;
       
       
       // instanciamos el proyecto
       System.out.println("Ingrese nombre del proyecto: ");
       nombre = Lector.leerString();
       System.out.println("Ingrese codigo: ");
       int codigo = Lector.leerInt();
       unProyecto = new Proyecto(nombre, codigo);
       double monto;
       
       System.out.println("Ingrese nombre del director: ");
       nombre = Lector.leerString();
       // agregamos el director
       unProyecto.setDirector(nombre);
       
       // instanciamos al investigador 1
       System.out.println("Ingrese nombre del investigador 1: ");
       nombre = Lector.leerString(); 
       System.out.println("Ingrese categoria: ");
       categoria = Lector.leerInt();
       System.out.println("Ingrese especialidad: ");
       especialidad = Lector.leerString();
       unInvestigador1 = new Investigador(nombre, categoria, especialidad);
       
       
       // instanciamos al investigador 2
       System.out.println("Ingrese nombre del investigador 2: ");
       nombre = Lector.leerString(); 
       System.out.println("Ingrese categoria: ");
       categoria = Lector.leerInt();
       System.out.println("Ingrese especialidad: ");
       especialidad = Lector.leerString();
       unInvestigador2 = new Investigador(nombre, categoria, especialidad);
       
       
       // otorgamos los subsidios
       for(int i=0;i<2;i++){
           System.out.println("Motivo subsidio: ");
           nombre = Lector.leerString();
           System.out.println("Monto: ");
           monto = Lector.leerDouble();
           unSubsidio = new Subsidio(nombre, monto);
           unInvestigador1.agregarSubsidio(unSubsidio);
       }
       
              for(int i=0;i<2;i++){
           System.out.println("Motivo subsidio: ");
           nombre = Lector.leerString();
           System.out.println("Monto: ");
           monto = Lector.leerDouble();
           unSubsidio = new Subsidio(nombre, monto);
           unInvestigador2.agregarSubsidio(unSubsidio);
       }
              
       //otorgamos los subsidios al primero de ellos: 
       unInvestigador1.otorgarTodos();
       
       //agregamos al proyecto
       unProyecto.agregarInvestigador(unInvestigador1);
       unProyecto.agregarInvestigador(unInvestigador2);
       
       //imprimimos
       System.out.println(unProyecto.toString());
    }
    
}
