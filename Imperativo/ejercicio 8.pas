{Escribir un programa que:
a. Implemente un módulo que lea números enteros y los almacene en un árbol
binario de búsqueda. La lectura finaliza con el valor 0.
b. Una vez generado el árbol, realice módulos independientes para:
i. Obtener el número más grande.
ii. Obtener el número más chico.
iii. Obtener la cantidad de elementos.
iv. Informar los números en orden creciente.
v. Informar los números pares en orden decreciente.}

program ejercicio8;
CONST
  CORTE = 0;
TYPE
  ABB = ^nodo;
  nodo = record
    elemento:integer;
    HD:ABB;
    HI:ABB;
  end;


{-----------------------------------------------------------------------------------
                                  MODULOS
------------------------------------------------------------------------------------}
// TODO: Implemente un módulo que lea números enteros y los almacene en un árbol binario de búsqueda

procedure insertarNodo(var arbol:ABB; num:integer);
begin
  if arbol = nil then begin
    new(arbol);
    arbol^.elemento:=num;
    arbol^.HI:=nil;
    arbol^.HD:=nil;
  end
  else if num < arbol^.elemento then
    insertarNodo(arbol^.HI, num)
  else insertarNodo(arbol^.HD, num);
end;

procedure crearArbol(var arbol:ABB);
var
  num:integer;
begin
  arbol:=nil;
  write('Ingrese el numero a insertar, 0 para detener: ');readln(num);
  while num <> CORTE do begin
    insertarNodo(arbol, num);
    write('Ingrese el numero a insertar, 0 para detener: ');readln(num);
  end;
end;

// TODO: Obtener el número más grande

function buscarMax(arbol:ABB):integer;
// por la estructura ordenada del arbol, solamente debo moverme al extremo derecho
begin
  if arbol = nil then buscarMax:=-1
  else begin
    if arbol^.HD=nil then buscarMax:=arbol^.elemento
    else buscarMax:=buscarMax(arbol^.HD);
  end;
end;

// TODO Obtener el número más chico

function buscarMin(arbol:ABB):integer;
// por la estructura ordenada del arbol, solamente debo moverme al extremo derecho
begin
  if arbol = nil then buscarMin:=-1
  else begin
    if arbol^.HI = nil then buscarMin:=arbol^.elemento
    else buscarMin:=buscarMin(arbol^.HI);
  end;
end;

// TODO Obtener la cantidad de elementos
procedure contarElementos(arbol:ABB;var cant:integer);
begin
  if arbol <> nil then begin
    contarElementos(arbol^.HI, cant);
    cant:=cant+1;
    contarElementos(arbol^.HD, cant);
  end;
end;

// TODO Informar los números en orden creciente.

procedure imprimir(arbol:ABB);
begin
  if arbol <> nil then begin
    imprimir(arbol^.HI);
    write('[ ', arbol^.elemento,']');
    imprimir(arbol^.HD);
  end;
end;

// TODO Informar los números pares en orden decreciente

procedure informarPares(arbol:ABB);
begin
  if arbol <> nil then begin
    informarPares(arbol^.HD);
    if (arbol^.elemento MOD 2 = 0) then
      write('[ ', arbol^.elemento,']');
	informarPares(arbol^.HI);
  end;
end;
{-----------------------------------------------------------------------------------
                                  PROGRAMA PRINCIPAL
------------------------------------------------------------------------------------}

VAR
  arbol:ABB;
  cant:integer;
BEGIN
  cant:=0; //cantidad de elementos
  crearArbol(arbol);
  writeln('El maximo es: ', buscarMax(arbol));
  writeln('El minimo es: ', buscarMin(arbol));
  contarElementos(arbol, cant);
  writeln('Cantidad de elementos: ', cant);
  writeln('Imprimir en orden creciente: ');
  imprimir(arbol);
  writeln();
  writeln('Pares en orden decreciente: ');
  informarPares(arbol);
END.
