/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package finales.libros;

/**
 *
 * @author juans
 */
public abstract class Libro {
    String titulo;
    double precioBase;
    String[] autores;
    int DIMF = 8;
    int dimL;
    
    public Libro(String titulo, double precio){
        this.titulo = titulo;
        this.precioBase = precio;
        this.dimL = 0;
        this.autores = new String[this.DIMF];
    }
    
    public void setTitulo(String titulo){
        this.titulo =  titulo;
    }
    public String getTitulo(){
        return this.titulo;
    }
    
    public double getPrecio(){
        return this.precioBase;
    }
    public void setPrecioBase(double p){
        this.precioBase = p;
    }
    
    public void setAutor(String autor){
        //se asume que hay espacio
        this.autores[this.dimL] = autor;
        this.dimL++;
    }
    public String getAutor(int pos){
        String resultado = "";
        if(this.dimL>0){
            if(pos>=0 && pos<this.dimL)
                resultado = this.autores[pos];
        }
        return resultado;
    }
    
    public String getAutores(){
        String resultado = "";
        if(this.dimL>0){
            for(int i=0;i<this.dimL;i++)
                resultado+= " | "+this.autores[i];
        }
        return resultado;
    }
    
    public String toString(){
        return "Titulo: "+this.getTitulo() +"\n Autores: "+ this.getAutores();
    }
    
}
