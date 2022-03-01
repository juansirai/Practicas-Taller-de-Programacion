{4. Escribir un programa que:
a. Implemente un módulo que genere una lista a partir de la lectura de números
enteros. La lectura finaliza con el número -1.
b. Implemente un módulo recursivo que devuelva el mínimo valor de la lista.
c. Implemente un módulo recursivo que devuelva el máximo valor de la lista.
d. Implemente un módulo recursivo que devuelva verdadero si un valor determinado
se encuentra en la lista o falso en caso contrario.
}

program ejercicio4;
CONST
  CORTE =-1;
TYPE
  lista = ^nodo;
  nodo = record
    elemento:integer;
    sig:lista;
  end;


{------------------------------------------------------------------
                            MODULOS
-------------------------------------------------------------------}

// TODO: a. Implemente un módulo que genere una lista a partir de la lectura de números enteros
procedure insertarNodo(var l:lista; num:integer);
var
  nue:lista;
begin
  new(nue);
  nue^.elemento:=num;
  nue^.sig:=l;
  l:=nue;
end;

procedure generarLista(var l:lista);
var
  num:integer;
begin
  l:=nil;
  num:=random(300)-1;
  while(num<>CORTE) do begin
    insertarNodo(l, num);
    num:=random(300)-1;
  end;
end;

procedure imprimirLista(l:lista);
begin
  while(l<> nil)do begin
    write('| ', l^.elemento,' |');
    l:=l^.sig;
  end;
end;

// TODO: Implemente un módulo recursivo que devuelva el mínimo valor de la lista


procedure buscarMin(var M:integer; l:lista);
begin
	if (l<> nil) then begin
		if l^.elemento < M then
			M:= l^.elemento;
		buscarMin(M, l^.sig);
	end;
end;

// TODO: Implemente un módulo recursivo que devuelva el maximo valor de la lista
procedure buscarMax(var M:integer; l:lista);
begin
	if (l<> nil) then begin
		if l^.elemento > M then
			M:= l^.elemento;
		buscarMax(M, l^.sig);
	end;
end;


// TODO: devuelva verdadero si un valor determinado se encuentra en la lista o falso en caso contrario
function buscarValor(l:lista; v:integer):boolean;
begin
  if (l<>nil)and (l^.elemento = v) then buscarValor:=TRUE
  else if (l<>nil) and (l^.elemento <>v) then buscarValor:=buscarValor(l^.sig, v)
  else buscarValor:=FALSE;
end;
{----------------------------------------------------------------------------------------------
                                PROGRAMA PRINCIPAL
-----------------------------------------------------------------------------------------------}
VAR
  l:lista;
  min:integer;
  max:integer;
  buscar:integer;
BEGIN
  min:=999;
  max:=-1;
  generarLista(l);
  imprimirLista(l);
  writeln();
  buscarMin(min, l);
  buscarMax(max, l);
  writeln('El minimo es: ',min );
  writeln('El maximo es: ',max );
  write('Ingrese un numero a buscar: ');readln(buscar);
  writeln(buscarValor(l, buscar));
END.
