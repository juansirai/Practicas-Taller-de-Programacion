/*
Implemente un programa que cargue un vector con a lo sumo 20 partidos disputados en el
campeonato. La información de cada partido se lee desde teclado hasta ingresar uno con
nombre de visitante “ZZZ” o alcanzar los 20 partidos. Luego de la carga informar:
- La cantidad de partidos que ganó River.
- El total de goles que realizó Boca jugando de local.
- El porcentaje de partidos finalizados con empate. 
 */
package week2;

import PaqueteLectura.Lector;

public class ejercicio06 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        String CORTE = "ZZZ";
        int DIMF = 20;
        Partido [] vectorPartido;
        int dimL;
        
        int partidosRiver = 0;
        int golesBoca = 0;
        int partidosEmpate = 0;
        
        String equipoVisitante;
        String equipoLocal;
        int golesV;
        int golesL;
        
        dimL = 0;
        vectorPartido = new Partido[DIMF];
        
        System.out.println("Partido "+(dimL+1));
        System.out.println("Equipo visitante:" );equipoVisitante = Lector.leerString();
        while(dimL < DIMF && !equipoVisitante.equals(CORTE)){
            System.out.println("Goles Visitante: ");
            golesV = Lector.leerInt();
            System.out.println("Equipo Local: ");
            equipoLocal = Lector.leerString();
            System.out.println("Goles Local: ");
            golesL = Lector.leerInt();
            vectorPartido[dimL] = new Partido(equipoLocal, equipoVisitante, golesL, golesV);
            
            dimL ++;
            System.out.println();
            System.out.println("**************************");
            if(dimL<DIMF){
                System.out.println("Partido "+(dimL+1));
                System.out.println("Equipo visitante:" );equipoVisitante = Lector.leerString();     
            }
        }
    
        int i;
        for(i=0;i<dimL;i++){
            if(vectorPartido[i].hayEmpate()){
                partidosEmpate++;
            }
            else
                if(vectorPartido[i].getGanador().equals("River")){
                partidosRiver ++;
            }
            if(vectorPartido[i].getLocal().equals("Boca")){
                golesBoca = golesBoca + vectorPartido[i].getGolesLocal();
            }
        }
        
        System.out.println("Resultados del Torneo: ");
        System.out.println("Partidos ganados por River: "+partidosRiver);
        System.out.println("Goles realizados por Boca de local: " + golesBoca);
        System.out.println("Porcentaje de partidos con empate: " + (float) partidosEmpate / dimL + "%");
    }
    
}
