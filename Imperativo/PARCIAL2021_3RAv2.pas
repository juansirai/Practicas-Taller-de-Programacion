program parcial;
const
	CORTE = -1;
	VALORALTO = 9999;
type
	fechas = record
		dia:integer;
		mes:integer;
		anio:integer;
	end;
	prestamo = record
		nroSocio:integer;
		isbn:integer;
		fecha:fechas;
	end;
	
	listaP  = ^nodoP;
	nodoP = record
		elemento:prestamo;
		sig:listaP;
	end;
	
	vectorPrestamos = array[1..12] of listaP;
	
	// estuctura que totaliza cantidad de prestamos por isbn
	datoA = record
		isbn:integer;
		total:integer;
	end;
	abb = ^nodoA;
	nodoA = record
		elemento:datoA;
		hi: abb;
		hd: abb;
	end;

//--- auxiliar para cargar estructuras, se disponen---
procedure generarFecha(var f:fechas);
begin
	f.dia:= random(30)+1;
	f.mes:= random(12)+1;
	f.anio:=2020;
end;

procedure generarPrestamo(var p:prestamo);
begin
	p.nroSocio:=random(2000)-1;
	if(p.nroSocio <> CORTE) then begin
		generarFecha(p.fecha);
		p.isbn:= random(2000);
	end;
end;

procedure insertarOrdenadoLista(var pri:listaP; p:prestamo);
var
	act, nue, ant:listaP;
begin
	new(nue);
	nue^.elemento:=p;
	act:=pri; ant:=pri;
	while(act<>nil) and (act^.elemento.isbn< p.isbn) do begin
		ant:=act;
		act:=act^.sig;
	end;
	if(act = ant) then
		pri:=nue
	else
		ant^.sig:=nue;
	nue^.sig:=act;
end;

procedure generarVector(var v:vectorPrestamos);
var
	i:integer;
	p:prestamo;
begin
	for i:=1 to 12 do
		v[i]:=nil;
	generarPrestamo(p);
	while(p.nroSocio <> CORTE) do begin
		insertarOrdenadoLista(v[p.fecha.mes], p);
		generarPrestamo(p);
	end;
	writeln('Estructura de prestamos cargada satisfactoriamente');
end;

procedure imprimirListaPrestamos(l:listaP);
begin
	while(l<>nil) do begin
		writeln('Nro Socio: ',l^.elemento.nroSocio, ' | ISBN : ',l^.elemento.isbn, ' | Fecha: ',l^.elemento.fecha.dia,'/',l^.elemento.fecha.mes,'/',l^.elemento.fecha.anio);
		l:=l^.sig;
	end;
end;

procedure imprimirVector(v:vectorPrestamos);
var
	i:integer;
begin
	for i:=1 to 12 do begin
		writeln('Mes ',i);
		imprimirListaPrestamos(v[i]);
		writeln();
	end;
end;


//---------INCISO A: GENERA ARBOL -------------------
procedure arbol(var a:abb; dato:datoA);
begin
	if(a=nil) then begin
		new(a); 
		a^.elemento:=dato;
		a^.hd:=nil; a^.hi:=nil;
	end
	else begin
		if(dato.isbn<a^.elemento.isbn) then
			arbol(a^.hi, dato)
		else
			arbol(a^.hd, dato);
	end;
end;

procedure minimo(var v:vectorPrestamos; var min:integer);
var
	i, pos:integer;
begin
	pos:=-1;
	min:=VALORALTO;
	for i:=1 to 12 do begin
		if(v[i] <> nil) then 
			if(v[i]^.elemento.isbn<min) then begin
				pos:=i;
				min:=v[i]^.elemento.isbn;
			end;
	end;
	if(pos<>-1) then
		v[pos]:=v[pos]^.sig; 
end;

procedure generarArbol(var a:abb; v:vectorPrestamos);
var	
	codMin:integer;
	dato : datoA;
begin
	minimo(v, codMin);
	while(codMin <> valorAlto) do begin
		dato.isbn:= codMin;
		dato.total:=0;
		while(codMin<>valorAlto) and (codMin = dato.isbn) do begin
			dato.total+=1;
			minimo(v, codMin);
		end;
		arbol(a, dato);
	end;
end;

procedure imprimirArbol(a:abb);
begin
	if(a<>nil) then begin
		imprimirArbol(a^.hi);
		writeln('ISBN: ',a^.elemento.isbn,'| Total: ',a^.elemento.total);
		imprimirArbol(a^.hd);
	end;
end;

//-------------------INCISO B-------------------------------------------
function masDeVeinticinco(a:abb; sup:integer):integer;
begin
	if(a=nil) then
		masDeVeinticinco:=0
	else begin
		if(a^.elemento.isbn<=sup) then begin
			if(a^.elemento.total>=2) then
				masDeVeinticinco:= 1 +masDeVeinticinco(a^.hi, sup) + masDeVeinticinco(a^.hd, sup)
			else
				masDeVeinticinco:=0+masDeVeinticinco(a^.hi, sup) + masDeVeinticinco(a^.hd, sup)
		end
		else
			masDeVeinticinco:=masDeVeinticinco(a^.hi, sup);
	end;
end;

VAR
	v:vectorPrestamos;
	a:abb;
	sup:integer;
BEGIN
	generarVector(v);
	imprimirVector(v);
	a:=nil;
	generarArbol(a, v);
	imprimirArbol(a);
	writeln('Ingrese ISBN Limite: ');readln(sup);
	writeln('Cantidad de libros con mas de 5 prestamos menores a ',sup, ': ',masDeVeinticinco(a, sup));
END.