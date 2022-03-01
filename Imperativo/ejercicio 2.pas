{
Netflix ha publicado la lista de películas que estarán disponibles durante el mes de
diciembre de 2021. De cada película se conoce: código de película, código de género (1:
acción, 2: aventura, 3: drama, 4: suspenso, 5: comedia, 6: bélica, 7: documental y 8: terror)
y puntaje promedio otorgado por las críticas.
Implementar un programa modularizado que:
a. Lea los datos de películas y los almacene por orden de llegada y agrupados por
código de género, en una estructura de datos adecuada. La lectura finaliza cuando se lee
el código de la película -1.
b. Una vez almacenada la información, genere un vector que guarde, para cada
género, el código de película con mayor puntaje obtenido entre todas las críticas.
c. Ordene los elementos del vector generado en b) por puntaje utilizando alguno de
los dos métodos vistos en la teoría.
d. Luego de ordenar el vector, muestre el código de película con mayor puntaje y el
código de película con menor puntaje.
}

program ejercicio2;
CONST
  CORTE = -1; // cod pelicula corte
TYPE
  generos = 1..8;
  pelicula = record
    codPeli: integer;
    codGenero: generos;
    puntaje: real;
  end;
  lista = ^nodo;
  nodo = record
    elemento:pelicula;
    sig:lista;
  end;
  vectorGeneros = array[generos] of lista;

  peliMaximos = record
    codPeli:integer;
    puntaje:real;
  end;
  vectorMaximos = array[generos] of peliMaximos;

{---------------------------------------------------------------------
                   DECLARACION DE MODULOS
----------------------------------------------------------------------}

// TODO: Lea los datos de películas y los almacene por orden de llegada y agrupados porcódigo de género
procedure leerPelicula(var p:pelicula);
// permite leer de manera aleatoria los componentes requeridos por el record "pelicula"
begin
  p.codPeli:= random(200)-1;
  if(p.codPeli <> CORTE) then begin
    p.codGenero:=random(8)+1;
    p.puntaje:= random * 100;
  end;
end;

procedure insertarAtras(var pri:lista; peli:pelicula);
// reserva espacio en memoria e inserta nuevo nodo ultimo en la lista.
var
  nue, act:lista;
begin
  new(nue); nue^.elemento:=peli; nue^.sig:=nil; //ya que mi elemento será el ultimo
  if (pri = nil) then
    pri:=nue
  else begin
    act:=pri;
    while(act^.sig <> nil) do //comparo con act^.sig para no pasarme, quiero frenar justo en el ultimo.
      act:=act^.sig;
    act^.sig:=nue;
  end;
end;

procedure iniciarVectorListas(var v:vectorGeneros);
var
	i:generos;
begin
	for i:=1 to 8 do
		v[i]:=nil;
end;

procedure cargarVector(var v:vectorGeneros);
var
  p: pelicula;
begin
  leerPelicula(p);
  while(p.codPeli <> CORTE) do begin
    insertarAtras(v[p.codGenero], p);
    leerPelicula(p);
  end;
end;

// TODO: genere un vector que guarde, para cada género, el código de película con mayor puntaje obtenido
procedure buscarMaximo(var Cmax:integer;var Pmax:real; Cdato:integer; Pdato:real);
begin
  if (Pdato > Pmax) then begin
    Pmax:= Pdato;
    Cmax:= Cdato;
  end;
end;

procedure generarVectorMaximos(var vM:vectorMaximos; vG:vectorGeneros);
var
  i:generos;
  max : peliMaximos;
begin
  //recorro el vector
  for i:=1 to 8 do begin
    //recorro cada lista
    max.puntaje := -1;
    while (vG[i]<>nil) do begin
      //actualizo el maximo
      buscarMaximo(max.codPeli, max.puntaje, vG[i]^.elemento.codPeli, vG[i]^.elemento.puntaje);
      vG[i]:=vG[i]^.sig;
    end;
    //guardo en el vector de maximos
    vM[i]:=max;
  end;
end;


// TODO: Ordene los elementos del vector generado en b) por puntaje
procedure ordenarSeleccion(var v:vectorMaximos);
var
  i,j,p:generos;
  dato : peliMaximos;
begin
  for i:=1 to 7 do begin //recorre hasta dimL - 1, que coincide con DIMF
    p:=i;
    for j:=i+1 to 8 do
      if v[j].puntaje < v[p].puntaje then
        p:=j;
    dato := v[p];
    v[p]:= v[i];
    v[i]:=dato;
  end;
end;

{---------------------------------------------------------------------
                   PROGRAMA PRINCIPAL
----------------------------------------------------------------------}
VAR
  vG:vectorGeneros;
  vM:vectorMaximos;
BEGIN
  cargarVector(vG);
  generarVectorMaximos(vM, vG);
  ordenarSeleccion(vM);
  writeln('Codigo Minimo: ', vM[1].codPeli, 'Puntaje minimo: ', vM[1].puntaje);
  writeln('Codigo Maximo: ', vM[8].codPeli, 'Puntaje maximo: ', vM[8].puntaje);
END.
