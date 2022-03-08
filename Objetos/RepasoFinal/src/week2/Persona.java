/*
Un objeto persona puede crearse sin valores iniciales o enviando en el mensaje de creación el
nombre, DNI y edad (en ese orden). Un objeto persona responde a los siguientes mensajes:
getNombre() retorna el nombre (String) de la persona
getDNI() retorna el dni (int) de la persona
getEdad() retorna la edad (int) de la persona
setNombre(X) modifica el nombre de la persona al “String” pasado por parámetro (X)
setDNI(X) modifica el DNI de la persona al “int” pasado por parámetro (X)
setEdad(X) modifica la edad de la persona al “int” pasado por parámetro (X)
toString() retorna un String que representa al objeto. Ej: “Mi nombre es Mauro, mi DNI es
11203737 y tengo 70 años” 
 */
package week2;

/**
 *
 * @author juans
 */
public class Persona {
    /*variables de instancia*/
    String nombre;
    int dni;
    int edad;

    public Persona(String nombre, int dni,int edad) {
        this.nombre = nombre;
        this.dni = dni;
        this.edad = edad;
    }
    
    public Persona(){
    }
    
    public void setNombre(String unNombre){
        this.nombre = unNombre;
    }
    public String getNombre(){
        return this.nombre;
    }
    
    public void setDNI(int unDNI){
        this.dni = unDNI;
    }
    public int getDNI(){
        return this.dni;
    }
    
    public void setEdad(int unaEdad){
        this.edad = unaEdad;
    }
    public double getEdad(){
        return this.edad;
    }
    
    public String toString(){
        String aux="Mi nombre es "+this.getNombre()+ " mi DNI es " +this.getDNI()+ " y tengo " + this.edad+" años";
        return aux;
    }
}
