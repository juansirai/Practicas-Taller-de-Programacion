/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package adicionales.ejercicio04;

/**
 *
 * @author juans
 */
public abstract class Grupo {
    private Paciente[] vectorPacientes;
    private int DIMF = 10;
    private int dimL;
    
    public Grupo(){
        this.vectorPacientes = new Paciente[this.DIMF];
        this.dimL = 0;
    }
    
    public boolean hayLugar(){
        return this.dimL<this.DIMF;
    }
    
    public int agregarPaciente(Paciente p){
        /*Agregar un paciente P al grupo y retornar su número identificatorio en el grupo (ID).*/
        int posicion = -1;
        if(this.hayLugar()){
            this.vectorPacientes[dimL] = p;
            posicion = dimL;
            dimL++;
        }
        return posicion;
    }
    
    public Paciente retornarPaciente(int i){
        Paciente p = null;
        if(i>=0 && i<this.DIMF)
            p = this.vectorPacientes[i];
        return p;
    }
    
    public abstract void aplicarDosis(double d);
   
    public int getDIMF(){
        return this.DIMF;
    }
    
    public int getDimL(){
        return this.dimL;
    }
    
    public Paciente[] getPacientes(){
        return this.vectorPacientes;
    }
    
    public String toString(){
        String resultado = "";
        for(int i=0;i<this.dimL;i++){
            resultado+="ID: "+i+" Nombre: "+this.vectorPacientes[i].getNombre()+" Ultima glucosa: "+this.vectorPacientes[i].getUltResultado()+" Ultima dosis: "+this.vectorPacientes[i].getUltDosis()+"\n";
        }
        return resultado;
    }
}
