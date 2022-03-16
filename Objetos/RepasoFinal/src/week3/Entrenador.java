/*
Un entrenador
se caracteriza por su nombre, sueldo básico y la cantidad de campeonatos ganados.
▪ Defina métodos para obtener/modificar el valor de cada atributo.
▪ Defina el método calcularSueldoACobrar que calcula y devuelve el sueldo a cobrar por
el entrenador. El sueldo se compone del sueldo básico, al cual se le adiciona un plus por
campeonatos ganados (5000$ si ha ganado entre 1 y 4 campeonatos; $30.000 si ha
ganado entre 5 y 10 campeonatos; 50.000$ si ha ganado más de 10 campeonatos).
 */
package week3;

/**
 *
 * @author juans
 */
public class Entrenador {
    String nombre;
    double sueldoBasico;
    int campGanados;
    
    //constructores
    public Entrenador(String N, double S, int C){
        this.nombre = N;
        this.sueldoBasico = S;
        this.campGanados = C;
    }
    public Entrenador(){
    }
    
    //setters y getters
    public String getNombre(){
        return this.nombre;
    }
    public void setNombre(String X){
        this.nombre = X;
    }
    
    public double getSueldoBasico(){
        return this.sueldoBasico;
    }
    public void setSueldoBasico(double X){
        this.sueldoBasico = X;
    }
    
    public int getCampeonatosGanados(){
        return this.campGanados;
    }
    public void setCampeonatosGanados(int X){
        this.campGanados = X;
    }
    
    //metodo sueldo a cobrar
    public double calcularSueldoACobrar(){
        double variable = 0;
        if(this.campGanados>0){
            if(this.campGanados<=4) variable = 5000;
            else if(this.campGanados<=10) variable = 30000;
            else variable = 50000;
        }
        return this.sueldoBasico + variable;
    }
}
