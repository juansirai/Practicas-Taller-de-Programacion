/*
5-A- Definir una clase para representar flotas de micros. Una flota se caracteriza por
conocer a los micros que la componen (a lo sumo 15). Defina un constructor para crear
una flota vacía (sin micros).
Implemente métodos para:
i. devolver si la flota está completa (es decir, si tiene 15 micros o no).
ii. agregar a la flota un micro recibido como parámetro.
iii. eliminar de la flota el micro con patente igual a una recibida como parámetro, y
retornar si la operación fue exitosa.
iv - buscar en la flota un micro con patente igual a una recibida como parámetro y
retornarlo (en caso de no existir dicho micro, retornar null).
v. buscar en la flota un micro con destino igual a uno recibido como parámetro y
retornarlo (en caso de no existir dicho micro, retornar null)
 */
package week4;

/**
 *
 * @author juans
 */
public class Flota {
    int DIMF = 15;
    Micro [] micros;
    int ocupacion;
    
    public Flota(){
        micros = new Micro[this.DIMF];
        this.ocupacion = 0;
    }
    
    public boolean estaCompleta(){
        return this.ocupacion == this.DIMF;
    }
    
    //ii. agregar a la flota un micro recibido como parámetro.
    public void agregarMicro(Micro x){
        if (!this.estaCompleta()){
            micros[this.ocupacion] = x;
            this.ocupacion ++;
        }
    }
    
    public int buscarMicro(String x){
        int i=0;
        boolean encontre = false;
        while(i<this.DIMF && ! encontre){
            if(this.micros[i]!=null){
                   if(this.micros[i] .getPatente().equals(x)) encontre = true;
                   else i++;
            }
            else i++;
        }
        if (encontre) return i;
        else return -1;
    }
    
    //iii. eliminar de la flota el micro con patente igual a una recibida como parámetro, y retornar si la operación fue exitosa.
    
    public boolean eliminarMicro(String patente){
        boolean exito = false;
        int i = this.buscarMicro(patente) ;
        if( i != -1){
            this.micros[i] = null;
            this.ocupacion --;
            exito = true;
        }
        return exito;
    }
    
    //iv - buscar en la flota un micro con patente igual a una recibida como parámetro y retornarlo (en caso de no existir dicho micro, retornar null).
    public Micro retornarMicro(String patente){
          boolean exito =false;
          int i = this.buscarMicro(patente);
          if(i !=-1) return this.micros[i];
          else return null;
    }
    
    //v. buscar en la flota un micro con destino igual a uno recibido como parámetro y retornarlo (en caso de no existir dicho micro, retornar null)
    public Micro buscarPorDestino(String destino){
        int i=0;
        boolean encontre = false;
        while(i<this.DIMF && ! encontre){
            if(this.micros[i]!=null ){
                if(this.micros[i].getDestino().equals(destino)) encontre = true;
                else i++;
            }
            else i++;
        }
        if (encontre) return this.micros[i];
        else return null;
    }
    
}

