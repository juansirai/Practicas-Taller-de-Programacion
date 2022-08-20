/*
Un psicólogo necesita un sistema para organizar su agenda semanal. El sistema mantiene para c/u de los 5 días
de atención y c/u de los 6 turnos (horarios) del día, la información del paciente que tomó el turno. De los
pacientes guarda: nombre, si tiene obra social y costo a abonar por la sesión.
a) Genere las clases necesarias. Implemente constructores para iniciar: el sistema sin pacientes; los pacientes
a partir de toda su información.
b) Lea atentamente y luego implemente métodos que permitan:
- Agendar al paciente P en un día D y turno T. Asuma que el turno está libre. D y T son válidos.
- Dado el nombre de un paciente, liberar todos sus turnos.
- Dado un día D y el nombre de un paciente, devolver si el paciente tiene agendado un turno ese día. Asuma
que D es válido.
c) Realice un programa que instancie el sistema. Cargue varios pacientes al sistema. Libere turnos agendados.
Para finalizar, imprima el resultado del inciso b.iii.
 */
package finales.psicologo;

import PaqueteLectura.Lector;

public class Main {

    public static Paciente cargarPaciente(){
        Paciente unPaciente;
        String nombre;
        boolean os;
        double costo;
        
        System.out.println("Nombre: ");nombre = Lector.leerString();
        System.out.println("Tiene OS?: ");os = Lector.leerBoolean();
        System.out.println("Costo: "); costo = Lector.leerDouble();
        unPaciente = new Paciente(nombre, os, costo);
        return unPaciente;
    }
    public static void main(String[] args) {
        Paciente unPaciente;
        Sistema miSistema;
        int D;
        int T;
        boolean continua = true;
        miSistema = new Sistema();
        String nombre;
        
        while(continua){
            unPaciente = cargarPaciente();
            System.out.println("Dia de turno: ");D = Lector.leerInt();
            System.out.println("Hora de turno: "); T = Lector.leerInt();
            miSistema.agregarPaciente(D, T, unPaciente);
            System.out.println("Desea continuar? ");continua = Lector.leerBoolean();
        }
        
        System.out.println(miSistema.toString());
        
        System.out.println("De que paciente desea liberar turnos? ");nombre = Lector.leerString();
        miSistema.liberarTurnos(nombre);
        System.out.println(miSistema.toString());
        
        System.out.println("De que paciente desea averiguar turnos? ");nombre = Lector.leerString();
        System.out.println("En que dia? : ");D = Lector.leerInt();
        System.out.println("El paciente tiene turno: "+miSistema.tieneTurno(D, nombre));
    }
    
}
