/*
 Un micro conoce su patente, destino, hora
salida, el estado de sus 20 asientos (es decir si está o no ocupado) y la cantidad de asientos
ocupados al momento.
 */
package week4;

/**
 *
 * @author juans
 */
public class Micro {
    String patente;
    int horaSalida;
    int ocupacion;
    String destino;
    boolean [] asientos;
    
    
    /*a) Implemente un constructor que permita iniciar el micro con una patente, un destino y
una hora de salida (recibidas por parámetro) y sin pasajeros.*/
    public Micro(String patente, String destino, int horaSalida){
        this.patente = patente;
        this.destino = destino;
        this.horaSalida = horaSalida;
        this.ocupacion = 0;
        this.asientos = new boolean[20]; //por defecto los booleanos tienen valor false
    }
    public Micro(){
    }
    
    public void setPatente(String X){
        this.patente = X;
    }
    public String getPatente(){
        return this.patente;
    }
    
    public void setDestino(String X){
        this.destino = X;
    }
    public String getDestino(){
        return this.destino;
    }
    
    public void setHoraSalida(int X){
        this.horaSalida = X;
    }
    public int getHoraSalida(){
        return this.horaSalida;
    }
    
    public int getOcupacion(){
        return this.ocupacion;
    }
    
    //devolver si el micro está lleno
    public boolean estaLleno(){
        return this.ocupacion==20;
    }
    
    //validar un número de asiento recibido como parámetro
    public boolean asientoValido(int X){
        return (X >=0) && (X <20);
    }
    
    //devolver el estado de un nro. de asiento válido recibido como parámetro
    public boolean estado(int X){
        boolean result = false;
        if(this.asientoValido(X)){
            result = this.asientos[X];
        }
        return result;
    }
    
    //ocupar un nro. de asiento válido recibido como parámetro
    public void ocuparAsiento(int X){
        if( ! this.estado(X)){
            //corroboro que no esté ocupado. Supongo que el asiento es valido
            this.asientos[X] = true;
            this.ocupacion++;
        }
    }
    
    //liberar un nro. de asiento válido recibido como parámetro
    public void liberarAsiento(int X){
        this.asientos[X] = false;
    }
    
    //devolver el nro. del primer asiento libre
    public int buscarAsiento(){
        int i = 0;
        while(i<20 &&  asientos[i]){
            i++;
        }
        if(i<20) return i;
        else return -1;
    }
    
}
