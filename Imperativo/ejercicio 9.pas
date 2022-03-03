{9. Implemente un programa que invoque a un módulo que genere un árbol binario de
búsqueda con nombres de personas que se leen desde teclado. La lectura finaliza con el
nombre ‘ZZZ’ que no debe procesarse. También debe invocar a otro módulo que reciba el
árbol generado y un nombre, y retorne verdadero si existe dicho nombre en el árbol o falso
en caso contrario.
}

program ejercicio9;
CONST
  CORTE = 'ZZZ';
TYPE
  nombre = string[30];
  arbol = ^nodo;
  nodo = record
    elemento: nombre;
    HD: arbol;
    HI: arbol;
  end;

{-------------------------------------------------------------------
                        MODULOS DEL PROGRAMA
--------------------------------------------------------------------}
procedure cargarNodo(var abb:arbol; dato:nombre);
begin
  if (abb = nil) then begin
    new(abb);
    abb^.elemento:=dato;
    abb^.HD:=nil; abb^.HI:=nil;
  end
  else if dato<abb^.elemento then cargarNodo(abb^.HI, dato)
  else cargarNodo(abb^.HD, dato)
end;

procedure generarArbol(var abb:arbol);
var
  nom: nombre;
begin
  write('Ingrese nombre: '); readln(nom);
  while (nom <> CORTE) do begin
    cargarNodo(abb, nom);
    write('Ingrese nombre: '); readln(nom);
  end;
end;

procedure imprimirArbol(abb:arbol);
begin
  if abb <> nil then begin
    imprimirArbol(abb^.HI);
    writeln(abb^.elemento);
    imprimirArbol(abb^.HD);
  end;
end;

function buscarNombre(abb:arbol; nom:nombre):boolean;
begin
  if abb = nil then buscarNombre:=FALSE
  else if abb^.elemento = nom then buscarNombre:= TRUE
  else begin
	if nom < abb^.elemento then buscarNombre:=buscarNombre(abb^.HI,nom)
	else buscarNombre:= buscarNombre(abb^.HD, nom);
  end;
end;
{-------------------------------------------------------------------
                        PROGRAMA PRINCIPAL
--------------------------------------------------------------------}

VAR
  abb:arbol;
  nom:nombre;
  continua : char;
BEGIN
  abb:=nil;
  generarArbol(abb);
  imprimirArbol(abb);
  continua:='Y';
  while continua='Y' do begin
	write('Ingrese nombre a buscar: ');readln(nom);
	writeln('El resultado de la busqueda es: ',buscarNombre(abb, nom));
	write('Continua? Y/N: ');readln(continua);
  end;
END.
