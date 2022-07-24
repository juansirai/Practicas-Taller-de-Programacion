/*
 Escriba un programa que instancie cuatro coros y que los vaya almacenando en un
arreglo. El tipo de cada uno de los cuatro coros es leído por teclado. Una vez leído el
tipo de coro se deberá leer o bien la cantidad de coristas (en el caso del coro
semicircular) o la cantidad de hileras e integrantes por hilera (en el caso del coro por
hileras). Luego se deberá crear la cantidad de coristas necesarios, leyendo sus datos, y
almacenándolos en el coro. Finalmente imprima toda la información de los cuatro
coros indicando si están bien formados o no
 */
package adicionales.ejercicio03;

import PaqueteLectura.Lector;

public class ejercicio03 {

    public static Director  crearDirector(){
        System.out.println("Cargaremos los datos del director \n");
        String nombre;
        int dni;
        int edad;
        int antiguedad;
        
        System.out.println("Nombre: ");
        nombre = Lector.leerString();
        System.out.println("DNI: ");
        dni = Lector.leerInt();
        System.out.println("Edad: ");
        edad = Lector.leerInt();
        System.out.println("Antiguedad: ");
        antiguedad = Lector.leerInt();
        Director direc = new Director(nombre, dni, edad, antiguedad);
 
        return direc;
        
    }
    public static Corista crearCorista(){
        System.out.println("Cargaremos los datos del corista \n");
        String nombre;
        int dni;
        int edad;
        int tono;
        
        System.out.println("Nombre: ");
        nombre = Lector.leerString();
        System.out.println("DNI: ");
        dni = Lector.leerInt();
        System.out.println("Edad: ");
        edad = Lector.leerInt();
        System.out.println("Tono fundamental: ");
        tono = Lector.leerInt();
        Corista c = new Corista(nombre, dni, edad, tono);
 
        return c;
        
    }
    
    
    public static CoroCircular instanciarCoroCircular(){
        Director direc;
        direc = crearDirector();
        System.out.println("Cantidad de coristas: ");
        int cantCoristas = Lector.leerInt();
        CoroCircular coro = new CoroCircular(direc,cantCoristas);
        
         //instanciamos los coristas
        for(int i=0;i<cantCoristas;i++){
            Corista cori  =crearCorista();
            coro.agregarCorista(cori);
        }       
        return coro;
    }
    
    public static CoroHileras instanciarCoroHileras(){
        Director direc;
        direc = crearDirector();
        System.out.println("Cantidad de coristas: ");
        int cantCoristas = Lector.leerInt();
        System.out.println("Cant hileras: ");
        int cantHileras = Lector.leerInt();
        CoroHileras coro = new CoroHileras(direc,cantCoristas, cantHileras);
        
        //instanciamos los coristas
        for(int i=0;i<cantCoristas;i++){
            Corista cori  =crearCorista();
            coro.agregarCorista(cori);
        }
        return coro;
    }
    
    public static void main(String[] args) {
        System.out.println("Bienvenido al programa musical, vamos a instanciar 4 tipos de coro, por favor elije si quiere que sean de tipo: hilera/circular");
        String tipo;
        
        //instanciamos los 4 coros
        System.out.println("Tipo de coro 1: ");
        tipo = Lector.leerString();
        if(tipo.equals("circular")){
            CoroCircular coro1;
            coro1 = instanciarCoroCircular();
            System.out.println(coro1.toString());
            System.out.println("Esta bien formado: "+coro1.estaBienFormado());
        }
        else if(tipo.equals("hilera")){
            CoroHileras coro1;
            coro1= instanciarCoroHileras();
            System.out.println(coro1.toString());
            System.out.println("Esta bien formado: "+coro1.estaBienFormado());
        }
        
        System.out.println("Tipo de coro 2: ");
        tipo = Lector.leerString();
        if(tipo.equals("circular")){
            CoroCircular coro2 = instanciarCoroCircular();
            System.out.println(coro2.toString());
            System.out.println("Esta bien formado: "+coro2.estaBienFormado());
        }
        else if(tipo.equals("hilera")){
            CoroHileras coro2  = instanciarCoroHileras();
            System.out.println(coro2.toString());
            System.out.println("Esta bien formado: "+coro2.estaBienFormado());
        }
        
        System.out.println("Tipo de coro 3: ");
        tipo = Lector.leerString();
        if(tipo.equals("circular")){
            CoroCircular coro3 = instanciarCoroCircular();
            System.out.println(coro3.toString());
            System.out.println("Esta bien formado: "+coro3.estaBienFormado());
        }
        else if(tipo.equals("hilera")){
            CoroHileras coro3 = instanciarCoroHileras();
            System.out.println(coro3.toString());
            System.out.println("Esta bien formado: "+coro3.estaBienFormado());
        }
        
        System.out.println("Tipo de coro 4: ");
        tipo = Lector.leerString();
        if(tipo.equals("circular")){
            CoroCircular coro4 = instanciarCoroCircular();
            System.out.println(coro4.toString());
            System.out.println("Esta bien formado: "+coro4.estaBienFormado());
        }
        else if(tipo.equals("hilera")){
            CoroHileras coro4  = instanciarCoroHileras();
            coro4.toString();
        }
        
        }
    }
    

