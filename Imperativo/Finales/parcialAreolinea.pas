{1. Una aerolínea dispone de un árbol binario de búsqueda con la información de sus
empleados. De cada empleado se conoce: Número de legajo, Dni, Categoría (1.20) y año de
ingreso a la empresa. El árbol se encuentra ordenado por número de legajo. Se solicita:

Implementar un módulo que reciba el árbol de empleados, número de legajo “A”,
número de legajo “B” y un número de categoría, y retorne un vector ordenado por
número de legajo. El vector debe contener el número de legajo y Dni de aquellos
empleados cuyo número de legajo se encuentra comprendido entre los números de
legajo recibidos ("A” y “8”, siendo “A” menor que “B”) y la categoría se corresponda con
la recibida por parámetro. Por norma de la empresa, cada categoría puede contar con
a lo sumo 250 empleados.

Implementar un módulo recursivo que reciba la información generada en “b” y retorne
el promedio de los números de Dni
}

PROGRAM practicando;
CONST
	CORTE = -1;
	DIMF = 250;
TYPE
	categorias = 1..20;
	empleado = record
		legajo:integer;
		dni:integer;
		categoria:categorias;
		ingreso:integer;
	end;
	
	abb = ^nodoA;
	nodoA = record
		elemento: empleado;
		hd: abb;
		hi:abb;
	end;
	
	datoVector = record
		legajo:integer;
		dni: integer
	end;
	vector = array[1..DIMF] of datoVector;
	
{*******************
*  OPCIONAL, CARGA EL ARBOL QUE SE DISPONE
* *******************}
procedure cargarEmpleado(var e:empleado);
begin
	e.legajo:= random(250)-1;
	if(e.legajo <> CORTE) then begin
		e.dni:= random(2000);
		e.categoria:= random(20)+1;
		e.ingreso:= random(10) + 2000;
	end;
end;

procedure arbol(var a:abb; e:empleado);
begin
	if(a=nil) then begin
		new(a);
		a^.elemento:=e;
		a^.hi:=nil; a^.hd:=nil;
	end
	else begin
		if(e.legajo < a^.elemento.legajo) then
			arbol(a^.hi, e)
		else
			arbol(a^.hd, e);
	end;
end;

procedure generarArbol(var a:abb);
var
	e:empleado;
begin
	cargarEmpleado(e);
	while(e.legajo <>CORTE) do begin
		arbol(a, e);
		cargarEmpleado(e);
	end;
end;

procedure imprimirArbol(a:abb);
begin
	if(a<>nil) then begin
		imprimirArbol(a^.hi);
		writeln('Legajo: ',a^.elemento.legajo, ' DNI: ', a^.elemento.dni,' Categoria: ',a^.elemento.categoria,' Ingreso: ',a^.elemento.ingreso);
		imprimirArbol(a^.hd);
	end;
end;

{INCISO A GENERAR VECTOR}
procedure insertar(var v:vector;var dimL:integer; dato:datoVector);
begin
	if(dimL<DIMF) then begin
		dimL+= 1;
		v[dimL]:= dato;
	end;
end;

procedure generarVector(var v:vector; var dimL:integer;a:abb; var numA, numB:integer; categoria:categorias);
var
	dato:datoVector;
begin
	if(a<>nil) then begin
		if(a^.elemento.legajo<=numB) and(a^.elemento.legajo>=numA) then begin
			generarVector(v, dimL, a^.hi, numA, numB, categoria);
			if(a^.elemento.categoria = categoria) then begin
				dato.legajo:= a^.elemento.legajo;
				dato.dni:= a^.elemento.dni;
				insertar(v, dimL, dato);
			end;
			generarVector(v, dimL, a^.hd, numA, numB, categoria);
		end
		else begin
			if(a^.elemento.legajo>numB) then
				generarVector(v, dimL, a^.hi, numA, numB, categoria)
			else
				generarVector(v, dimL, a^.hd, numA, numB, categoria);
		end;
	end;
end;

procedure imprimirVector(v:vector; dimL:integer);
var
	i:integer;
begin
	for i:=1 to dimL do 
		writeln('Legajo: ', v[i].legajo, 'DNI: ', v[i].dni);
end;



{Implementar un módulo recursivo que reciba la información generada en “b” y retorne
el promedio de los números de Dni}

function promedio(v:vector; i, dimL:integer):real;
begin
	if(i=dimL) then
		promedio:= v[i].dni / dimL
	else 
		promedio:= v[i].dni / dimL + promedio(v, (i+1), dimL);
end;

VAR
	a:abb;
	v:vector;
	dimL:integer;
	numA, numB:integer;
	categoria:categorias;
	i:integer;
BEGIN
	a:=nil;
	dimL:=0;
	i:=1;
	generarArbol(a);
	imprimirArbol(a);
	writeln('Ingrese categoria: ');
	readln(categoria);
	writeln('Ingrese numero A: ');
	readln(numA);
	writeln('Ingrese numero B: ');
	readln(numB);
	generarVector(v, dimL, a , numA, numB, categoria);
	imprimirVector(v, dimL);
	writeln('El promedio de DNI es: ',promedio(v, i,dimL):1:2);
END.