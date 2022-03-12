/*
B- Realizar un programa principal que instancie un triángulo, le cargue información leída
desde teclado e informe en consola el perímetro y el área. 
 */
package week3;
import PaqueteLectura.Lector;

public class ejercicio01 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Triangulo unTriangulo;
        double unL1;
        double unL2;
        double unL3;
        String unCR;
        String unCL;
        
        System.out.println("Lado 1: ");
        unL1 = Lector.leerDouble();
        System.out.println("Lado 2: ");
        unL2 = Lector.leerDouble();
        System.out.println("Lado 3: ");
        unL3 = Lector.leerDouble();
        System.out.println("Color Relleno: ");
        unCR = Lector.leerString();
        System.out.println("Color Linea: ");
        unCL = Lector.leerString();
        
        unTriangulo = new Triangulo(unL1, unL2, unL3, unCR, unCL);
        
        System.out.println("Perimetro: " + unTriangulo.calcularPerimetro() );
        System.out.println("Area: " + unTriangulo.calcularArea());
    }
    
}
