{Un psicólogo necesita un sistema para administrar a sus pacientes. De cada paciente registra:
dni, cód. de paciente, obra social (1: ioma 2: pami 3: osde 4: galeno 5: no tiene) y costo abonado
por sesión. Implemente un programa que:
a) Genere un ABB ordenado por dni. Para ello, genere información hasta el paciente con dni 0.
A partir del ABB, realice módulos (uno por inciso) para:
b) Generar una estructura con los códigos de los pacientes de osde cuyo dni está comprendido
entre dos valores.
c) Aumentar el costo abonado por sesión de todos los pacientes en un monto recibido.
NOTA: Realice el programa principal que invoque a los módulos desarrollados.}

PROGRAM parcial;
CONST
	CORTE = 0; //DNI DE CORTE
TYPE
	obrasSociales = 1..5;
	paciente = record
		dni:integer;
		codigo:integer;
		obraSocial: obrasSociales;
		costo:real;
	end;

	arbol = ^nodo;
	nodo = record
		elemento:paciente;
		hi:arbol;
		hd:arbol;
	end;

	lista = ^nodoL;
	nodoL = record
		elemento:integer;
		sig:lista;
	end;

//---------------CARGA DEL ARBOL ----------------------
procedure leerPaciente(var p:paciente);
begin
	p.dni:= random(2999);
	if(p.dni <> CORTE) then begin
		p.codigo:= random(2999);
		p.obraSocial:= random(5)+1;
		p.costo:= random* 1000;
	end;
end;

procedure abb(var a:arbol; p:paciente);
begin
	if(a=nil) then begin
		new(a);
		a^.elemento:=p;
		a^.hi:=nil;
		a^.hd:=nil;
	end
	else begin
		if(p.dni < a^.elemento.dni) then
			abb(a^.hi, p)
		else
			abb(a^.hd, p);
	end;
end;

procedure crearArbol(var a:arbol);
var
	p:paciente;
begin
	leerPaciente(p);
	while(p.dni <> CORTE) do begin
		abb(a, p);
		leerPaciente(p);
	end;
	writeln('Arbol cargado con exito');
end;

procedure imprimirArbol(a:arbol);
begin
	if(a<>nil) then begin
		imprimirArbol(a^.hi);
		writeln('| DNI: ',a^.elemento.dni,'| Codigo: ',a^.elemento.codigo,' | OS: ',a^.elemento.obraSocial,' | Costo: ',a^.elemento.costo:1:2);
		imprimirArbol(a^.hd);
	end;
end;

{-------TODO:b) Generar una estructura con los códigos de los pacientes de osde cuyo dni está comprendido
			entre dos valores.}
procedure insertarAtras(var pri, ult:lista; codigo:integer);
var
	nue:lista;
begin
	new(nue); nue^.elemento:=codigo; nue^.sig:=nil;
	if(pri=nil) then
		pri:=nue
	else
		ult^.sig:=nue;
	ult:=nue;
end;

procedure generarLista(var pri, ult:lista; a:arbol; num1, num2:integer);
begin
	if(a<>nil) then begin
		if((a^.elemento.dni>=num1) and (a^.elemento.dni<=num2)) then begin
			if(a^.elemento.obraSocial = 3) then
				insertarAtras(pri, ult, a^.elemento.codigo);
			generarLista(pri, ult, a^.hi, num1, num2);
			generarLista(pri, ult, a^.hd, num1, num2);
		end
		else begin
			if(a^.elemento.dni<num1) then
				generarLista(pri, ult, a^.hd, num1, num2)
			else
				generarLista(pri, ult, a^.hi, num1, num2);
		end;
	end;
end;

{c) Aumentar el costo abonado por sesión de todos los pacientes en un monto recibido}
procedure aumentarCosto(var a:arbol; monto:real);
begin
	if(a<>nil) then begin
		aumentarCosto(a^.hi, monto);
		a^.elemento.costo+=monto;
		aumentarCosto(a^.hd, monto);
	end;
end;

procedure imprimirLista(pri:lista);
begin
	writeln('Imprimimos lista: ');
	while(pri<>nil) do begin
		write('| ',pri^.elemento,' ');
		pri:=pri^.sig;
	end;
end;

{c) Dado un dni, aumentar el costo abonado por sesión en un monto recibido}
procedure aumentarCostoInd(var a:arbol; p:integer; monto:real);
begin
	if(a<> nil) then begin
		if(a^.elemento.dni=p) then
			a^.elemento.costo+=monto
		else begin
			if(p<a^.elemento.dni) then
				aumentarCostoInd(a^.hi, p, monto)
			else
				aumentarCostoInd(a^.hd, p, monto)
		end;
	end;
end;

VAR
	a:arbol;
	pri, ult:lista;
	num1, num2:integer;
	monto:real;
	p:integer;
BEGIN
	a:=nil; pri:=nil;ult:=nil;
	crearArbol(a);
	imprimirArbol(a);
	write('Ingrese numero 1: ');readln(num1);
	write('Ingrese numero 2: ');readln(num2);
	generarLista(pri, ult, a, num1, num2);
	imprimirLista(pri);
	write('Ingrese el monto en el que desea aumentar el costo: '); readln(monto);
	aumentarCosto(a, monto);
	imprimirArbol(a);
	write('DNI paciente a aumentar monto: ');readln(p);
	write('Monto a aumentar: ');readln(monto);
	aumentarCostoInd(a, p, monto);
	imprimirArbol(a);
END.
