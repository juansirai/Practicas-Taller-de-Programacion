/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package adicionales.ejercicio05;

/**
 *
 * @author juans
 */
public class Libro {
    private String titulo;
    private double peso;
    private int cantPaginas;
    private Autor autor;
    
    public Libro(String titulo, double peso, int cantPaginas, Autor autor){
        this.titulo = titulo;
        this.peso = peso;
        this.cantPaginas = cantPaginas;
        this.autor = autor;
    }
    
    public void setTitulo(String titulo){
        this.titulo = titulo;
    }
    public String getTitulo(){
        return this.titulo;
    }
    
    public void setPeso(double peso){
        this.peso = peso;
    }
    public double getPeso(){
        return this.peso;
    }
    
    public void setCantPaginas(int cantPaginas){
        this.cantPaginas = cantPaginas;
    }
    public int getCantPaginas(){
        return this.cantPaginas;
    }
    
    public void setAutor(Autor a){
        this.autor = a;
    }
    public Autor getAutor(){
        return this.autor;
    }
    
    public String toString(){
        return "El libro seleccionado es "+this.titulo+" \n cantidad de paginas: "+this.getCantPaginas()+" \n Peso: "+this.getPeso();
    }
}
