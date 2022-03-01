{Una librería requiere el procesamiento de la información de sus productos. De cada
producto se conoce el código del producto, código de rubro (del 1 al 8) y precio.
Implementar un programa modularizado que:
a. Lea los datos de los productos y los almacene ordenados por código de producto y
agrupados por rubro, en una estructura de datos adecuada. El ingreso de los productos
finaliza cuando se lee el precio 0.
Una vez almacenados, muestre los códigos de los productos pertenecientes a cada rubro.
b. Genere un vector (de a lo sumo 30 elementos) con los productos del rubro 3.
Considerar que puede haber más o menos de 30 productos del rubro 3. Si la cantidad de
productos del rubro 3 es mayor a 30, almacenar los primeros 30 que están en la lista e
ignore el resto.
c. Ordene, por precio, los elementos del vector generado en b) utilizando alguno de
los dos métodos vistos en la teoría.
d. Muestre los precios del vector ordenado.

}

program ejercicio3;
CONST
  CORTE = 0; // precio de corte;
  DIMF = 30; //maximos de productos rubro 3 que voy a almacenar en el vector
TYPE
  rubros = 1..8;
  producto = record
    codP:integer;
    codR:rubros;
    precio:real;
  end;

  lista = ^nodo;
  nodo = record
    elemento:producto;
    sig:lista;
  end;
  vectorListas = array[rubros] of lista;

  vectorTres = array[1..DIMF] of producto;
{-----------------------------------------------------------
                    DECLARACION DE MODULOS
------------------------------------------------------------}

// TODO: Lea los datos de los productos y los almacene ordenados por código de producto y agrupados por rubro

procedure leerProducto(var p:producto);
begin
  p.precio:= random * random(1000);
  if (p.precio <> 0) then begin
    p.codP:= random(1000);
    p.codR := random(8)+1;
  end;
end;


procedure insertarOrdenado(var l: lista; p:producto);
var
	nue, ant, act: lista;
begin
	new(nue);
	nue^.elemento:= p;
	ant:= l;
	act:= l;
	while((act <> nil) and (p.codP> act^.elemento.codP)) do begin
		ant:= act;
		act:= act^.sig;
	end;
	if(ant = act) then
		l:= nue
	else
		ant^.sig:= nue;
	nue^.sig:= act;
end;

procedure iniciarVectorListas(var v:vectorListas);
//inicia el puntero al primer elemento de cada lista del vector en Nil.
var
  i:rubros;
begin
  for i:=1 to 8 do
    v[i]:=nil;
end;

procedure cargarVector(var v:vectorListas);
var
  p:producto;
begin
  iniciarVectorListas(v);
  leerProducto(p);
  while (p.precio <> CORTE) do begin
    insertarOrdenado(v[p.codR], p);
    leerProducto(p);
  end;
end;

// TODO: Una vez almacenados, muestre los códigos de los productos pertenecientes a cada rubro.

procedure imprimirCodigos(v:vectorListas);
var
  i:rubros;
begin
  for i:=1 to 8 do begin
    writeln('Productos rubro: ',i);
    while (v[i] <> nil) do begin
      writeln('Rubro: ', v[i]^.elemento.codR, ' - Codigo: ', v[i]^.elemento.codP);
      v[i]:= v[i]^.sig;
    end;
  end;
end;


// TODO: Genere un vector (de a lo sumo 30 elementos) con los productos del rubro 3
procedure generarVectorTres(var v3:vectorTres; var dimL:integer; l:lista);
begin
  dimL:=0;
  while (l<>nil) and (dimL<30) do begin
    dimL:=dimL+1;
    v3[dimL] :=l^.elemento;
    l := l^.sig;
  end;
end;

procedure imprimirVector(v3:vectorTres; dimL:integer);
var
  i:integer;
begin
  for i:=1 to dimL do
    writeln('Cod P: ', v3[i].codP, ' Precio: ',v3[i].precio:1:2);
end;

// TODO: Ordene, por precio, los elementos del vector generado en b)
procedure ordenarSeleccion(var v:vectorTres; dimL:integer);
var
  i, j, p:integer;
  elemento:producto;
begin
	for i:=1 to dimL-1 do begin {busca el mínimo y guarda en p la posición}
		p := i;
        for j := i+1 to dimL do
			if v[j].precio < v[p].precio then p:=j;
         {intercambia v[i] y v[p]}
			elemento := v [p];
			v[p] := v[i];
			v[i] := elemento;
    end;
end;

{-----------------------------------------------------------
                    PROGRAMA PRINCIPAL
------------------------------------------------------------}

VAR
  v: vectorListas;
  dimL:integer;
  v3:vectorTres;
BEGIN
  cargarVector(v);
  imprimirCodigos(v);
  generarVectorTres(v3, dimL, v[3]);
  writeln('Imprimimos el vector del codigo 3');
  imprimirVector(v3, dimL);
  writeln('Ordenamos el vector por precio: ');
  ordenarSeleccion(v3, dimL);
  imprimirVector(v3, dimL);
END.
