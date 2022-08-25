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
public abstract class Premiacion {
    private Alumno[] postulados;
    private int N;
    private int dimL;
    
    public Premiacion(int N){
        this.N = N;
        this.postulados = new Alumno[N];
    }
    
    public boolean hayLugar(){
        return this.dimL<this.N;
    }
    
    public boolean agregarPostulante(Alumno A){
        boolean exito = false;
        if(this.hayLugar()){
            this.postulados[this.dimL] =A;
            this.dimL++;
            exito = true;
        }
        return exito;
    }
    public int getDimL(){
        return this.dimL;
    }
    
    public Alumno getPostulado(int i){
        return this.postulados[i];
    }
    
    public abstract String otorgarPremio(int X);
}
