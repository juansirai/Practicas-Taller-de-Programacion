/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package parciales.sorteoSolidario;

import PaqueteLectura.GeneradorAleatorio;

public class SorteoComun extends SorteoSolidario{
    
    public SorteoComun(double p){
        super(p);
    }
    
    public Persona sortear(){
        int ganador = GeneradorAleatorio.generarInt(super.getInscriptos());
        return super.obtenerPersona(ganador);
    
    }
}
