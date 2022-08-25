/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package parciales.premiaciones;

/**
 *
 * @author juans
 */
public class MejorGraduado extends Premiacion{
    
    public MejorGraduado(int N){
        super(N);
    }
    
    public String otorgarPremio(int X){
        String resultado ="Premiados al mejor graduado: ";
        for(int i=0;i<super.getDimL();i++){
            if(super.getPostulado(i).getPromedio()>X)
                resultado+="\nPostulado "+i+": "+super.getPostulado(i).getNombre();
        }
        return resultado;
    }
}
