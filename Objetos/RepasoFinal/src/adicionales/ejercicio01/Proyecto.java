/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package adicionales.ejercicio01;

/**
 *
 * @author juans
 */
public class Proyecto {
    private String nombre;
    private int codigo;
    private String director;
    private Investigador[] investigadores;
    private int dimL;
    private int DIMF = 50;
    
    public Proyecto(String nombre, int codigo){
        this.nombre = nombre;
        this.codigo = codigo;
        this.investigadores = new Investigador[this.DIMF];
        this.dimL = 0;
    }
    
    public void setDirector(String nombre){
        this.director = nombre;
    }
    
    public boolean hayLugar(){
        return this.dimL<this.DIMF;
    }
    
    public void agregarInvestigador(Investigador i){
        // agrega un investigador a un proyecto
        if(this.hayLugar()){
            this.investigadores[dimL] = i;
            this.dimL++;
        }
    }
    
    public double dineroTotalOtorgado(){
        double result = 0;
        for(int i=0; i<this.dimL;i++){
            result += this.investigadores[i].getMontoTotal();
        }
        return result;
    }
    
    
    public int getPosicion(String nombreApellido){
        int pos = -1;
        for(int i=0;i<this.dimL;i++){
            if(investigadores[i].getNombre().equals(nombreApellido))
                pos = i;
        }
        return pos;
    }
    
    public int cantidadDeSubsidios(String nombreApellido){
        int resultado = -1;
        //buscar investigador
        int pos = this.getPosicion(nombreApellido);
        if(pos!=-1)
            resultado = this.investigadores[pos].getDimL();
        return resultado;
        
    }
    
    public String toString(){
        String resultado = "Proyecto: "+this.nombre + " Codigo: "+this.codigo +" Director: " + this.director+" Total de dinero otorgado: "+this.dineroTotalOtorgado();
        for(int i=0;i<this.dimL;i++){
            resultado+=investigadores[i].toString();
        }
        return resultado;
    
    }
    
}
