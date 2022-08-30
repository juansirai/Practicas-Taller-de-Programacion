/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package parciales.concursoMusica;

/**
 *
 * @author juans
 */
public class Concurso {
    private Alumno[][] matriz;
    private int N;
    private int M;
    private int[] dimL;
    
    public Concurso(int N){
        this.N = N;
        this.M = 5;
        this.matriz = new Alumno[this.M][this.N];
        this.dimL = new int[this.M];
        for(int i=0;i<this.M;i++)
            this.dimL[i] = 0;
    }
    
    
    public boolean hayLugar(int codGenero){
        return this.dimL[codGenero] < this.N;
    }
    
    public boolean generoValido(int codGenero){
        return (codGenero>=0) && (codGenero <this.M);
    }
    
    public void inscribirAlumno(Alumno a, int codGenero){
        if(this.hayLugar(codGenero) && this.generoValido(codGenero)){
            this.matriz[codGenero][this.dimL[codGenero]] = a;
            this.dimL[codGenero]++;
        }
    }
    
    /*dado el nombre de un alumno, devolver el instrumento que toca.
    el alumno podria no estar inscripto*/
    public String devolverInstrumento(String nombre){
        String resultado="Alumno no encontrado";
        boolean encontre = false;
        int i = 0;
        while(i<this.M && !encontre){
            int j = 0;
            while(j<this.N && !encontre){
                if(this.matriz[i][j] != null){
                    if(this.matriz[i][j].getNombre().equals(nombre)){
                        resultado = this.matriz[i][j].instrumento();
                        encontre = true;
                    }
                }
                j++;
            }
            i++;
        }
        return resultado;
    }
    
    /*devuelve cuantos alumnos tocan un determinado instrumento*/
    public int contarInstrumentistas(String instrumento){
        int resultado = 0;
        for(int i=0; i<this.M; i++){
            for(int j=0;j<this.N;j++){
                if(this.matriz[i][j] != null){
                    if(this.matriz[i][j].instrumento().equals(instrumento))
                        resultado++;
                }
            }
        }
        return resultado;
    }
}
