{ Un teatro tiene funciones los 7 días de la semana. Para cada día se tiene una lista con las
entradas vendidas. Se desea procesar la información de una semana

Implementar un programa que:
a. Genere 7 listas con las entradas vendidas para cada día. De cada entrada se lee día (de 1
a 7), código de la obra, asiento y monto. La lectura finaliza con el código de obra igual a 0.
Las listas deben estar ordenadas por código de obra de forma ascendente.
b. Genere una nueva lista que totalice la cantidad de entradas vendidas por obra. Esta lista
debe estar ordenada por código de obra de forma ascendente
}

program ejercicio13;
const
  CORTE = 0;
type
  dias = -1..7;
  entrada = record
    dia:dias;
    codObra:integer;
    asiento:integer;
    monto : real;
  end;

  lista1 = ^nodo1;
  nodo1 = record
    elemento:entrada;
    sig:lista1;
  end;

  vectorEntradas = array [dias] of lista1;

  resumen = record
    codObra:integer;
    cantidad:integer;
  end;
  lista2 = ^nodo2;
  nodo2 = record
    elemento:resumen;
    sig:lista2;
  end;

{----------------------------------------------------------------
                  MODULOS
-----------------------------------------------------------------}
procedure leerEntrada(var e:entrada);
begin
  e.codObra := random(200);
  if (e.codObra <> CORTE) then begin
    e.dia:= random(7)+1;
    e.asiento:= random(300);
    e.monto:= random * 100;
  end;
end;

procedure insertarOrdenado(var l:lista1; e:entrada);
var
  ant, act, nue:lista1;
begin
  new(nue); nue^.elemento:=e;
  act:= l; ant:= l;
  while (act <> nil ) and (act^.elemento.codObra < e.codObra) do begin
    ant:=act;
    act:=act^.sig;
  end;
  if(ant = act) then
    l:=nue
  else
    ant^.sig:=nue;
  nue^.sig:=act;
end;

procedure iniciarVector(var v:vectorEntradas);
var
  i:dias;
begin
  for i:=1 to 7 do
    v[i]:=nil;
end;

procedure cargarVector(var v:vectorEntradas);
var
  e:entrada;
begin
  iniciarVector(v);
  leerEntrada(e);
  while(e.codObra <> CORTE) do begin
    insertarOrdenado(v[e.dia], e);
    leerEntrada(e);
  end;
end;

procedure imprimirVector(v:vectorEntradas);
var
  i:dias;
begin
  for i:=1 to 7 do begin
    writeln('DIA: ',i);
    while(v[i] <> nil) do begin
      writeln('Cod Obra: ', v[i]^.elemento.codObra,' Asiento: ',v[i]^.elemento.asiento,' Monto: ',v[i]^.elemento.monto:1:2);
      v[i]:=v[i]^.sig;
    end;
  end;
end;

{ TODO  Genere una nueva lista que totalice la cantidad de entradas vendidas por obra. Esta lista
debe estar ordenada por código de obra de forma ascendente}

procedure insertarAtras(var l:lista2; codObra:integer;total:integer);
var
  act, ant, nue:lista2;
begin
  new(nue); nue^.elemento.codObra:=codObra; nue^.elemento.cantidad:=total;
  act:=l; ant:=l;
  while (act <> nil) do begin
    ant:=act;
    act:=act^.sig;
  end;
  if act = ant then
    l:=nue
  else
    ant^.sig:=nue;
  nue^.sig:=act;
end;

procedure minimo(var v:vectorEntradas; var codMin:integer);
var
  i:dias;
  iMin:integer;
begin
  codMin:=9999;
  iMin:=-1;
  for i:=1 to 7 do
    if(v[i]<>nil) then
		if (v[i]^.elemento.codObra <= codMin) then begin
			iMin:=i;
			codMin:=v[i]^.elemento.codObra;
		end;
  if (iMin <> -1) then
      v[iMin]:= v[iMin]^.sig;
end;

procedure merge(vectorCompleto:vectorEntradas;var lnue:lista2);
var
  codMin, actual:integer;
   cantTotal:integer;
begin
  lnue:=nil;
  minimo(vectorCompleto, codMin);
  while(codMin <> 9999 ) do begin
    actual:=codMin;
    cantTotal:=0;
    while(codMin<>9999) and (actual = codMin) do begin
      cantTotal:=cantTotal+ 1;
      minimo(vectorCompleto, codMin);
    end;
    insertarAtras(lnue, actual, cantTotal);
  end;
end;

procedure imprimirLista(l:lista2);
begin
  while (l<> nil) do begin
    writeln('Cod Obra: ', l^.elemento.codObra, ' Total: ', l^.elemento.cantidad);
    l:=l^.sig;
  end;
end;
{----------------------------------------------------------------
                  PROGRAMA PRINCIPAL
-----------------------------------------------------------------}

var
  v:vectorEntradas;
  l:lista2;
begin
  cargarVector(v);
  imprimirVector(v);
  merge(v, l);
  writeln();
  writeln('Lista Mergeada: ');
  imprimirLista(l);
end.
