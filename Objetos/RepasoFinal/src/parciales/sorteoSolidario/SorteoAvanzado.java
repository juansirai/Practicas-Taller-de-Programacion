/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package parciales.sorteoSolidario;

/**
 *
 * @author juans
 */
public class SorteoAvanzado extends SorteoSolidario{
    
    public SorteoAvanzado(double p){
        super(p);
    }
    
    
    public Persona sortear(){
        Persona resultado = null;
        double max = -1;
        for(int i=0;i<super.getInscriptos();i++){
            if(super.obtenerPersona(i).getColaboracion()>max){
                resultado = super.obtenerPersona(i);
                max = super.obtenerPersona(i).getColaboracion();
            }
        }
        return resultado;
    }
}
