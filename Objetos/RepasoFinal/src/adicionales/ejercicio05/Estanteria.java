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
public class Estanteria {
    private Libro[][] estantes;
    int N; //estantes 5
    int M; //libros por estantes 3
    
    public Estanteria(int N, int M){
        this.N = N;
        this.M = M;
        this.estantes = new Libro[N][M];
    }
    
    public Estanteria(){
        this.N = 5;
        this.M = 10;
        this.estantes = new Libro[5][10];
    }
    
    public boolean estanteValido(int E){
        return ((E>0)&& E<this.N);
    }
    
    public boolean lugarValido(int L){
        return ((L>0)&& L<this.M);
    }
    
    public boolean posicionValida(int E, int L){
        return (this.estanteValido(E) && this.lugarValido(L));
    }
    
    public void almacenarLibro(int E, int L, Libro b){
    /*
    almacenarLibro: recibe un libro, un nro. de estante y nro. de lugar válidos y guarda al libro en la
    estantería. Asuma que dicho lugar está disponible.
*/
    if(this.posicionValida(E, L))
        this.estantes[E][L] = b; 
    }
    
    
    public Libro sacarLibro(String titulo){
    /*
    sacarLibro: recibe el título de un libro, y saca y devuelve el libro con ese título, quedando su lugar
    disponible. Tenga en cuenta que el libro puede no existir.
    */
    Libro resultado = null;
    boolean encontre = false;
    int E=0;
    int L;
    while(E<this.N && !encontre){
        L=0;
        while(L<this.M && !encontre){
            if( !(this.estantes[E][L] == null)){
                if(this.estantes[E][L].getTitulo().equals(titulo)){
                    encontre = true;
                    resultado = this.estantes[E][L];
                    this.estantes[E][L] = null;
                }
            }
            System.out.println("L: "+L+" E"+E);
            L++;
        }
        E++;
    }
    return resultado;
    }
    
    
    public Libro calcularLibroMasGrande(){
    /*
    - calcularLibroMasGrande: calcula y devuelve el libro con más páginas de la estantería.
    */
    Libro resultado = null;
    int max = -1;
    for(int i=0;i<this.N;i++){
        for(int j=0; j<this.M;j++){
            if(this.estantes[i][j] != null){
                if(this.estantes[i][j].getCantPaginas()>max){
                    resultado = this.estantes[i][j];
                    max = this.estantes[i][j].getCantPaginas();
                }
            }
        }
    }
    return resultado;
    }
    
    
    public int calcularEstanteMasPesado(){
    /*
    - calcularEstanteMasPesado: calcula y devuelve el número del estante más pesado (teniendo en
      cuenta el peso de sus libros).
    */
    int nroEstante = -1;
    double max = -1;
    double pesoActual;
    for(int i=0; i<this.N;i++){
        pesoActual = 0;
        for(int j=0;j<this.M;j++){
            if(this.estantes[i][j] != null)
                pesoActual+=this.estantes[i][j].getPeso();
        }
        if(pesoActual>max){
            nroEstante = i;
            max = pesoActual;
        }
    }
    return nroEstante;
    }
    
}
