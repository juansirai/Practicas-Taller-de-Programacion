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
public class GrupoBeta extends Grupo {
    
    public GrupoBeta(){
        super();
    }
    
    public void aplicarDosis(double d){
        for(int i=0;i<super.getDimL();i++){
            if(super.getPacientes()[i].getUltResultado()>2.5)
                super.getPacientes()[i].aplicarDosis(d);
        }
    }
}
