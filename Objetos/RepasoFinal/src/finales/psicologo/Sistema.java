/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package finales.psicologo;

/**
 *
 * @author juans
 */
public class Sistema {
    private Paciente[][] matriz;
    private int dias = 5;
    private int turnos = 6;
    
    public Sistema(){
        this.matriz = new Paciente[this.dias][this.turnos];
    };
    
    public void agregarPaciente(int D, int T, Paciente p){
        //se asume que el turno está libre y D y T son validos
        this.matriz[D][T] = p;
    }
    
    public void liberarTurnos(String nombre){
        for(int D = 0;D<this.dias; D++){
            for(int T=0;T<this.turnos; T++){
                if(this.matriz[D][T] != null){
                    if(this.matriz[D][T].getNombre().equals(nombre))
                        this.matriz[D][T] = null;
                }
            }
        }  
    }
    
  public boolean tieneTurno(int D, String nombre){
      boolean encontre = false;
      int T = 0;
      while(!encontre && T<this.turnos){
          if(this.matriz[D][T] != null){
              encontre = this.matriz[D][T].getNombre().equals(nombre);
          }
          T++;
      }
      return encontre;
   }
  
  public String toString(){
      String resultado = "";
      for(int D=0; D<this.dias;D++){
          resultado+="Dia "+D;
          for(int T=0;T<this.turnos;T++){
              if(this.matriz[D][T] != null)
                 resultado+="\nTurno "+T+" "+this.matriz[D][T].toString();
          }
      }
      return resultado;
  }
}
