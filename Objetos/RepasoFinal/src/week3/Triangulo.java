/*
Definir una clase para representar triángulos. Un triángulo se caracteriza por el
tamaño de sus 3 lados (double), el color de relleno (String) y el color de línea (String).
El triángulo debe saber:
▪ Devolver/modificar el valor de cada uno de sus atributos (métodos get# y set#)
▪ Calcular el área y devolverla (método calcularArea)
▪ Calcular el perímetro y devolverlo (método calcularPerimetro)
NOTA: Calcular el área con la fórmula Á𝑟𝑒𝑎 = √𝑠(𝑠 − 𝑎)(𝑠 − 𝑏)(𝑠 − 𝑐) , donde a,b y c son
los lados y 𝑠 =
𝑎+𝑏+𝑐
2
. La función raíz cuadrada es Math.sqrt(#)

 */
package week3;

/**
 *
 * @author juans
 */
public class Triangulo {
    double L1;
    double L2;
    double L3;
    String relleno;
    String linea;
    
    
    //constructores de la clase
    public Triangulo(double L1, double L2, double L3, String relleno, String linea){
        this.L1 = L1;
        this.L2 = L2;
        this.L3 = L3;
        this.relleno = relleno;
        this.linea = linea;
    }
    public Triangulo(){
    }
    
    //metodos
    //▪ Devolver/modificar el valor de cada uno de sus atributos (métodos get# y set#)
    
    public void setL1(int X){
        this.L1 = X;
    }
    public double getL1(){
        return this.L1;
    }
    
   public void setL2(int X){
        this.L2 = X;
    }
    public double getL2(){
        return this.L2;
    }    
    
    public void setL3(int X){
        this.L3 = X;
    }
    public double getL3(){
        return this.L3;
    }
    
    public void setRelleno(String X){
        this.relleno = X;
    }
    public String getRelleno(){
        return this.relleno;
    }
    
    public void setLinea(String X){
        this.linea = X;
    }
    public String getLinea(){
        return this.linea;
    }
    
    //▪ Calcular el área y devolverla (método calcularArea)
    public double calcularArea(){
        double s = (double) (this.L1 + this.L2 + this.L3) / 2;
        double aux = s * (s-this.L1) * (s - this.L2) * (s - this.L3);
        return Math.sqrt(aux);
    }
    
    //calcular perimetro
    public double calcularPerimetro(){
        return this.L1 + this.L2 + this.L3;
    }
    
}
