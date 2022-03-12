/*
Se dispone de la clase Partido (ya implementada en la carpeta tema2). Un objeto
partido representa un encuentro entre dos equipos (local y visitante). Un objeto partido
puede crearse sin valores iniciales o enviando en el mensaje de creación el nombre del
equipo local, el nombre del visitante, la cantidad de goles del local y del visitante (en ese
orden). Un objeto partido sabe responder a los siguientes mensajes:

getLocal() retorna el nombre (String) del equipo local
getVisitante() retorna el nombre (String) del equipo visitante
getGolesLocal() retorna la cantidad de goles (int) del equipo local
getGolesVisitante() retorna la cantidad de goles (int) del equipo visitante
setLocal(X) modifica el nombre del equipo local al “String” pasado por parámetro (X)
setVisitante(X) modifica el nombre del equipo visitante al “String” pasado por parámetro (X)
setGolesLocal(X) modifica la cantidad de goles del equipo local “int” pasado por parámetro (X)
setGolesVisitante(X) modifica la cantidad de goles del equipo visitante “int” pasado por parámetro (X)
hayGanador() retorna un boolean que indica si hubo (true) o no hubo (false) ganador
getGanador() retorna el nombre (String) del ganador del partido (si no hubo retorna un String
vacío).
hayEmpate() retorna un boolean que indica si hubo (true) o no hubo (false) empate
 */
package week2;


public class Partido {
    String equipoLocal;
    String equipoVisitante;
    int golesLocal;
    int golesVisitante;
    
    // constructores
    public Partido(String local, String visitante, int golesLoc, int golesVis){
        this.equipoLocal = local;
        this.equipoVisitante = visitante;
        this.golesLocal = golesLoc;
        this.golesVisitante=golesVis;
    }
    public Partido(){
    }
    
    //metodos
    
public String getLocal(){
 //retorna el nombre (String) del equipo local
    return this.equipoLocal;
}

public String getVisitante(){
    //retorna el nombre (String) del equipo visitante
    return this.equipoVisitante;
} 

public int getGolesLocal(){
    //retorna la cantidad de goles (int) del equipo local
    return this.golesLocal;
} 

public int getGolesVisitante(){
    //retorna la cantidad de goles (int) del equipo visitante
    return this.golesVisitante;
} 

public void setLocal(String X) {
    //modifica el nombre del equipo local al “String” pasado por parámetro (X)
    this.equipoLocal = X;
}

public void setVisitante(String X){
    //modifica el nombre del equipo visitante al “String” pasado por parámetro (X)
    this.equipoVisitante = X;
} 

public void setGolesLocal(int X){
    //modifica la cantidad de goles del equipo local “int” pasado por parámetro (X)
    this.golesLocal = X;
} 

public void setGolesVisitante(int X){
     //modifica la cantidad de goles del equipo visitante “int” pasado por parámetro (X)
     this.golesVisitante = X;
}

public boolean hayGanador(){
     //retorna un boolean que indica si hubo (true) o no hubo (false) ganador
     return this.getGolesLocal() != this.getGolesVisitante();
}

public String getGanador(){
     //retorna el nombre (String) del ganador del partido (si no hubo retorna un String vacío).
     if(this.hayGanador()){
         if(this.golesLocal > this.golesVisitante) return this.equipoLocal;
         else return this.equipoVisitante;
       }
     else return " ";
    }

public boolean hayEmpate(){
     //retorna un boolean que indica si hubo (true) o no hubo (false) empate
     return this.getGolesLocal() == this.getGolesVisitante();
}

}
