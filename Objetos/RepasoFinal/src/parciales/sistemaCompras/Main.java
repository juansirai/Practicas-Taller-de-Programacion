/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package parciales.sistemaCompras;

import PaqueteLectura.Lector;
public class Main {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Producto unProducto;
        int codigo;
        double precioM;
        double precioMin;
        CompraMayorista unaCompraM;
        CompraMinorista unaCompramin;
        int N;
        int nro;
        int cuit;
        boolean jubilado;
        
        System.out.println("Compra mayorista: \nCantidad de productos a instanciar: ");
        N = Lector.leerInt();
        System.out.println("Nro compra: ");
        nro = Lector.leerInt();
       System.out.println("Cuit: ");
        cuit = Lector.leerInt();
        unaCompraM = new CompraMayorista(nro, N, cuit);
        for(int i=0; i<N;i++){
            System.out.println("Producto "+(i+1));
            System.out.println("Codigo: ");codigo = Lector.leerInt();
            System.out.println("Precio M: "); precioM = Lector.leerDouble();
            System.out.println("Precio m: ");precioMin = Lector.leerDouble();
            unProducto = new Producto(codigo, precioM, precioMin);
            unaCompraM.agregarProducto(unProducto);
        }
        
        System.out.println("Compra minorista: \nCantidad de productos a instanciar: ");
        N = Lector.leerInt();
        System.out.println("Nro compra: ");
        nro = Lector.leerInt();
       System.out.println("Jubilado: ");
        jubilado = Lector.leerBoolean();
        unaCompramin = new CompraMinorista(nro, N, jubilado);
        for(int i=0; i<N;i++){
            System.out.println("Producto "+(i+1));
            System.out.println("Codigo: ");codigo = Lector.leerInt();
            System.out.println("Precio M: "); precioM = Lector.leerDouble();
            System.out.println("Precio m: ");precioMin = Lector.leerDouble();
            unProducto = new Producto(codigo, precioM, precioMin);
            unaCompramin.agregarProducto(unProducto);
        }
        System.out.println("Compra Mayorista:  \n"+unaCompraM.toString());
        System.out.println("Compra Minorista:  \n"+unaCompramin.toString());
        

    }
    
}
