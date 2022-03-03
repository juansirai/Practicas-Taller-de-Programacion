{10. Implementar un programa que contenga:
a. Un módulo que lea información de alumnos de Taller de Programación y almacene
en una estructura de datos sólo a aquellos alumnos que posean año de ingreso posterior
al 2010. Esta estructura debe estar ordenada por legajo y debe ser eficiente para la
búsqueda por dicho criterio. De cada alumno se lee legajo, apellido, nombre, DNI y año de
ingreso.
b. Un módulo que reciba la nueva estructura e informe el nombre y apellido de
aquellos alumnos cuyo legajo sea inferior a 15853.
c. Un módulo que reciba la nueva estructura e informe el nombre y apellido de
aquellos alumnos cuyo legajo esté comprendido entre 1258 y 7692}

PROGRAM ejercicio10;
CONST
  ANIO_CONDICION = 2010;
  LEG_CORTE = -1; // No lo pide el programa, pero para eficientizar la carga manual.
TYPE
  str30 = string[30];
  alumno = record
    legajo : integer;
    apellido:str30;
    nombre:str30;
    dni : integer;
    anio_ingreso:integer;
  end;

  arbol = ^nodo;
  nodo = record
    elemento:alumno;
    HD:arbol;
    HI:arbol;
  end;



{------------------------------------------------------------------------------------------
                                  MODULOS
-------------------------------------------------------------------------------------------}
procedure randomString(tamanio:integer; var palabra:str30);
var  str,Result: str30;
begin
    str:='abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
    Result:='';
    repeat
        Result:=Result+str[Random(Length(str))+1];
    until(Length(Result)=tamanio);
    palabra:=Result;
end;


// TODO Un módulo que lea información de alumnos de Taller de Programación
procedure leerAlumno(var a:alumno);
begin
  a.legajo:= random(20000)-1;
  if a.legajo <> LEG_CORTE then begin
    randomString(30, a.apellido);
    randomString(30, a.nombre);
    a.dni := random(300)+1;
    a.anio_ingreso := random(20) + 2000; // genera anios entre 2000 y 2020
  end;
end;

procedure insertarNodo(var abb:arbol; a:alumno);
begin
  if abb = nil then begin
    new(abb); abb^.elemento:=a;
    abb^.HD := nil; abb^.HI:=nil;
  end
  else if a.legajo < abb^.elemento.legajo then insertarNodo(abb^.HI, a)
  else insertarNodo(abb^.HD, a);
end;

procedure generarArbol(var abb:arbol);
var
  a:alumno;
begin
  leerAlumno(a);
  while a.legajo <> LEG_CORTE do begin
    if (a.anio_ingreso> ANIO_CONDICION) then insertarNodo(abb, a);
    leerAlumno(a);
  end;
end;


// TODO reciba la nueva estructura e informe el nombre y apellido alumnos cuyo legajo sea inferior a 15853
procedure legajosBajos(abb:arbol);
begin
  if abb <> nil then begin
    if abb^.elemento.legajo < 15853 then begin
      legajosBajos(abb^.HI);
      writeln('Legajo: ',abb^.elemento.legajo,' Apellido: ', abb^.elemento.apellido, ' Nombre: ', abb^.elemento.nombre);
      legajosBajos(abb^.HD);
    end
    else legajosBajos(abb^.HI);
  end;
end;

// TODO  informe el nombre y apellido de aquellos alumnos cuyo legajo esté comprendido entre 1258 y 7692
procedure legajosMedios(abb:arbol);
begin
  if(abb <> nil) then begin
    if(abb^.elemento.legajo > 1258) and (abb^.elemento.legajo < 7692) then begin
      writeln('Legajo: ',abb^.elemento.legajo,' Apellido: ', abb^.elemento.apellido, ' Nombre: ', abb^.elemento.nombre);
      legajosMedios(abb^.HI);
      legajosMedios(abb^.HD);
    end
    else begin
      if(abb^.elemento.legajo <1258) then
        legajosMedios(abb^.HD);
      if(abb^.elemento.legajo > 7692) then
        legajosMedios(abb^.HI);
    end;
  end;
end;

VAR
  abb:arbol;

BEGIN
  abb:=nil;
  generarArbol(abb);
  writeln();
  writeln('Legajos inferiores a 15853: ');
  legajosBajos(abb);
  writeln();
  writeln('Legajos entre 1258 y 7692: ');
  legajosMedios(abb);
END.
