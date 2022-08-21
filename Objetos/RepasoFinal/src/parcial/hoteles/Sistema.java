/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package parcial.hoteles;

/**
 *
 * @author juans
 */
public class Sistema {
    private int pisos;
    private int habitaciones;
    private Habitacion[][] matriz;
    
    public Sistema(int N, int M){
        this.pisos = N;
        this.habitaciones = M;
        matriz = new Habitacion[N][M];
        // creamos las habitaciones y seteamos el costo.
        for(int i=0; i<N;i++){
            for(int j=0; j<M;j++){
                this.matriz[i][j] = new Habitacion(i);
            }
        }
    }
    
    public int ingresarCliente(Cliente c, int X){
    /*Se ingresa cliente en la primera habitacion desocupada del piso
        Asumo que hay una habitacion desocupada, y que el piso es valido*/
    int nroHab = 0;
    boolean encontre = false;
    while(!encontre){
        if(!this.matriz[X][nroHab].estaOcupada()){
            this.matriz[X][nroHab].ocupar(c);
            encontre = true;
        }
        else
            nroHab++;
    }
    return nroHab;
    }
    
    public String liberarHabitaciones(int Y){
        String resultado="";
        for(int i=0; i<this.pisos;i++){
            if(this.matriz[i][Y].estaOcupada())
                resultado+=this.matriz[i][Y].desocupar();
        }
        return resultado;
    }
    
    public String toString(){
        String resultado = "";
        for(int i=0;i<this.pisos;i++){
            resultado+= "Piso: "+i+"\n";
            for(int j=0;j<this.habitaciones;j++){
                resultado+="\nHabitacion "+j+this.matriz[i][j].toString();
            }
        }
        return resultado;
    }
}
