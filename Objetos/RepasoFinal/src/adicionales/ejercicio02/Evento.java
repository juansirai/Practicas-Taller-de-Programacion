/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package adicionales.ejercicio02;

/**
 *
 * @author juans
 */
public class Evento extends Recital{
    private String motivo;
    private String contratante;
    private String fecha;
    
    public Evento(String motivo, String contratante, String fecha, String nombreBanda, int cantCanciones){
        super(nombreBanda, cantCanciones);
        this.motivo = motivo;
        this.contratante = contratante;
        this.fecha = fecha;
    }
    
    public String getContratante(){
        return this.contratante;
    }
    
    public String actuar(){
        String resultado = "";
        switch(this.motivo){
             case "Beneficiencia": resultado+= "Recuerden colaborar con "+this.getContratante()+"\n";
                                                       break;
             case "TV": resultado+= "Saludos amigos televidentes"+"\n";
                                  break;
             case "Privado": resultado+= "Un saludo para" + this.getContratante()+"\n";
                                           break;
             default: resultado+="No reconocemos que tipo de evento es pero..."+"\n";
                             break;
    }
        resultado+=super.actuar();
        super.finalizar();
        return resultado;
    }
   
    public double calcularCosto(){
        switch(this.motivo){
                case "Beneficiencia": return 0;
                case "TV": return 50000;
                case "Privado": return 150000;
               default: return 0  ;
         }
    }
}
