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
public class Investigador {
    private String nombreApellido;
    private int categoria;
    private String especialidad;
    private Subsidio[] subsidios;
    private int dimL;
    private int DIMF = 5;
    
    public Investigador(String nombreApellido, int categoria, String especialidad){
        this.nombreApellido = nombreApellido;
        this.categoria = categoria;
        this.especialidad = especialidad;
        this.subsidios = new Subsidio[this.DIMF];
    }
    
    public boolean hayLugar(){
        return this.dimL<this.DIMF;
    }
    
    public void agregarSubsidio(Subsidio unSubsidio){
        // agrega un subsidio a un investigador
        if(this.hayLugar()){
            this.subsidios[dimL] = unSubsidio;
            this.dimL++;
        }
    }
    
    public double getMontoTotal(){
        double result = 0;
        for (int i=0;i<this.dimL;i++){
            if(this.subsidios[i].otorgado())
                result += this.subsidios[i].getMonto();
        }
        return result;
    }
    
    public int getDimL(){
        return this.dimL;
    }
    
    public String getNombre(){
        return this.nombreApellido;
    }
    
    public void otorgarTodos(){
        for(int i=0;i<dimL;i++){
            if(!subsidios[i].otorgado())
                subsidios[i].otorgar();
        }
    }
    
    public String toString(){
        String resultado = this.getNombre() + " Categoria: "+ this.categoria+ " Dinero de subsidios otorgados : "+this.getMontoTotal();
        return resultado;
    }
    
}
