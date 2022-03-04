{Un cine posee la lista de películas que proyectará durante el mes de octubre. De cada
película se conoce: código de película, código de género (1: acción, 2: aventura, 3: drama,
4: suspenso, 5: comedia, 6: bélica, 7: documental y 8: terror) y puntaje promedio otorgado
por las críticas.
Implementar un programa que contenga:
a. Un módulo que lea los datos de películas y los almacene ordenados por código de
película y agrupados por código de género, en una estructura de datos adecuada. La
lectura finaliza cuando se lee el código de película -1.
b. Un módulo que reciba la estructura generada en el punto a y retorne una
estructura de datos donde estén todas las películas almacenadas ordenadas por código de
película.
}

program ejercicio11;
CONST
  CORTE = -1; //cod pelicula corte
TYPE
  generos = -1..8;
  pelicula = record
    codPeli:integer;
    codGenero:generos;
    puntaje:real;
  end;

  lista = ^nodo;
  nodo = record
    elemento: pelicula;
    sig:lista;
  end;
  vectorPelis = array[generos] of lista;

  listaUnica = ^nodo1;
  nodo1 = record
    elemento:pelicula;
    sig:listaUnica;
  end;

{-----------------------------------------------------------------------------
                        Modulos
-----------------------------------------------------------------------------}
// TODO :Un módulo que lea los datos de películas
procedure cargarPeli(var p:pelicula);
begin
  p.codPeli:=random(1000)-1;
  if(p.codPeli <> CORTE) then begin
    p.codGenero:= random(8)+1; //numeros aleatorios de 1 a 8
    p.puntaje:= random * 10;
  end;
end;

procedure insertarNodo(var pri:lista; peli:pelicula); //debemos insertarlos ordenados
var
  nue, ant, act:lista;
begin
  new(nue); nue^.elemento:=peli; nue^.sig:=nil;
  ant:=pri;
  act:=pri;
  while (act <> nil) and (peli.codPeli > act^.elemento.codPeli) do begin
    ant:=act;
    act:=act^.sig;
  end;
  if(ant=act) then
    pri:=nue
  else
    ant^.sig:=nue;
  nue^.sig:=act;
end;


procedure iniciarVector(var v:vectorPelis);
var i:generos;
begin
  for i:=1 to 8 do
    v[i]:=nil;
end;


procedure generarVector(var v:vectorPelis);
var
  p:pelicula;
begin
  iniciarVector(v);
  cargarPeli(p);
  while(p.codPeli <> CORTE) do begin
    insertarNodo(v[p.codGenero], p);
    cargarPeli(p);
  end;
end;

procedure imprimirVector(v:vectorPelis);
var
  i:generos;
begin
  for i:=1 to 8 do begin
    writeln('-----------------------------------------');
    writeln('           GENERO DE PELICULA ', i);
    writeln('-----------------------------------------');
    while (v[i]<> nil) do begin
      writeln('Cod Peli: ', v[i]^.elemento.codPeli,' - Puntaje: ', v[i]^.elemento.puntaje:1:2);
      v[i]:=v[i]^.sig;
    end;
  end;
end;


// TODO estructura de datos donde estén todas las películas almacenadas ordenadas por código

procedure agregarAtras(var l:listaUnica; peli:pelicula);
var
  nue, act, ant:listaUnica;
begin
  new(nue); nue^.elemento:=peli;
  act:=l;
  ant:=l;
  while act<> nil do begin
    ant:=act;
    act:=act^.sig;
  end;
  if act = ant then
    l:=nue
  else
    ant^.sig:=nue;
  nue^.sig:=act;
end;

procedure minimo(var todos:vectorPelis; var min:pelicula);
var indiceMin, i:generos;
begin
  min.codPeli:= 9999; indiceMin:= -1;
  for i:= 1 to 8 do
     if (todos[i] <> nil) then
       if (todos[i]^.elemento.codPeli <= min.codPeli) then
       begin
		indiceMin:= i;
        min:= todos[i]^.elemento;
	   end;
  if (indiceMin <> -1) then
      todos[indiceMin]:= todos[indiceMin]^.sig;
end;

procedure merge(var l:listaUnica; v:vectorPelis);
var
  min:pelicula;
begin
  l:=nil;
  minimo(v, min);
  while min.codPeli <> 9999 do begin
    agregarAtras(l, min);
    minimo(v, min);
  end;
end;

procedure imprimirLista(l:listaUnica);
begin
  while l<> nil do begin
    writeln('Cod Peli: ',l^.elemento.codPeli, ' Cod genero: ', l^.elemento.codGenero,' Puntaje: ', l^.elemento.puntaje);
	l:=l^.sig;
  end;
end;
{-----------------------------------------------------------------------------
                        programa principal
-----------------------------------------------------------------------------}

VAR
  v:vectorPelis;
  l:listaUnica;
BEGIN
  generarVector(v);
  imprimirVector(v);
  merge(l, v);
  writeln();
  writeln();
  writeln('Lista Unica: ');
  imprimirLista(l);
END.
