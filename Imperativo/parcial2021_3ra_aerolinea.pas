program parcial;
const
	CORTE = -1;
	VALORALTO=9999;
type
	dias = 1..30;
	venta = record
		dniCliente:integer;
		codVuelo: integer;
		monto: real;
		diaVenta: dias;
	end;
	
	listaVenta= ^nodoV;
	nodoV = record
		elemento:venta;
		sig:listaVenta;
	end;
	
	vectorVentas = array[1..30] of listaVenta;
	
	datoArbol = record
		monto:real;
		dia:dias;
		cantidad:integer;
	end;
	
	abb = ^nodoA;
	nodoA = record
		elemento: datoArbol;
		hd: abb;
		hi: abb;
	end;
{-----------AUXILIARES ESTRUCTURA QUE SE DISPONE----------}
procedure generarVenta(var v:venta);
begin
	v.dniCliente:= random(1000) -1;
	if(v.dniCliente <> CORTE) then begin
		v.codVuelo:= random(1000);
		v.monto:= random * 10;
		v.diaVenta:= random(30)+1;
	end;
end;

procedure insertarOrdenado(var pri:listaVenta; v:venta);
var
	ant, act, nue:listaVenta;
begin
	new(nue);
	nue^.elemento:=v;
	ant:=pri; act:=pri;
	while(act<>nil) and (act^.elemento.diaVenta<v.diaVenta) do begin
		ant:=act;
		act:= act^.sig;
	end;
	if(act = ant) then
		pri:=nue
	else
		ant^.sig:= nue;
	nue^.sig:= act;
end;

procedure generarVectorIniciarl(var v:vectorVentas);
var
	dato:venta;
	i:integer;
begin
	for i:=1 to 30 do begin
		v[i]:= nil;
		generarVenta(dato);
		while(dato.dniCliente<> CORTE) do begin
			insertarOrdenado(v[i], dato);
			generarVenta(dato);
		end;
	end;
	writeln('Vector generado.');
end;

procedure imprimirLista(pri:listaVenta);
begin
	while(pri<>nil) do begin
		writeln('Dia: ',pri^.elemento.diaVenta, ' | DNI: ',pri^.elemento.dniCliente,' | Cod Vuelo: ',pri^.elemento.codVuelo, ' | Monto: ',pri^.elemento.monto:1:2);
		pri:= pri^.sig;
	end;
end;

procedure imprimirVector(v:vectorVentas);
var
	i:integer;
begin
	for i:=1 to 30 do begin
		writeln('Destino ',i,' :');
		imprimirLista(v[i]);
	end;
end;


{----------------INCISO A----------------}

procedure insertarArbol(var a:abb; dato:datoArbol);
begin
	if(a= nil) then begin
		new(a);
		a^.elemento:= dato;
		a^.hd:=nil; a^.hi:=nil;
	end
	else begin
		if(dato.monto< a^.elemento.monto) then
			insertarArbol(a^.hi, dato)
		else
			insertarArbol(a^.hd, dato);
	end;
end;

procedure minimo(var v:vectorVentas;var diaMin:integer; var montoMin:real);
var
	i, pos:integer;
begin
	diaMin:= VALORALTO;
	pos:=-1;
	for i:= 1 to 30 do begin
		if(v[i] <> nil) then
			if(v[i]^.elemento.diaVenta < diaMin) then begin
				diaMin:=v[i]^.elemento.diaVenta;
				pos:=i;
			end;
	end;
	if(pos<>-1) then begin
		montoMin:=v[pos]^.elemento.monto;
		v[pos]:= v[pos]^.sig;
	end;
end;

procedure generarArbol(var a:abb; v:vectorVentas);
var
	diaMin: integer;
	datoA: datoArbol;
	montoMin:real;
begin
	minimo(v, diaMin, montoMin);
	while(diaMin <> VALORALTO) do begin
		datoA.dia:= diaMin;
		datoA.cantidad:=0;
		datoA. monto:=0;
		while(diaMin<>VALORALTO) and (diaMin = datoA.dia) do begin
			datoA.monto+= montoMin;
			datoA.cantidad+= 1;
			minimo(v, diaMin, montoMin);
		end;
		insertarArbol(a, datoA);
	end;
end;

procedure imprimirArbol(a:abb);
begin
	if(a<>nil) then begin
		imprimirArbol(a^.hi);
		writeln('Monto: ',a^.elemento.monto:1:2,' Dia: ', a^.elemento.dia,' Cantidad: ', a^.elemento.cantidad);
		imprimirArbol(a^.hd);
	end;
end;


{------------inciso b-------------}
function diasMenorA(a:abb; monto:real):integer;
begin
	if(a=nil) then
		diasMenorA:=0
	else begin
		if(a^.elemento.monto<=monto) then
			diasMenorA:= 1+diasMenorA(a^.hi, monto)  + diasMenorA(a^.hd, monto)
		else
			diasMenorA:= diasMenorA(a^.hi, monto);
	end;
end;

VAR
	v: vectorVentas;
	a:abb;
	monto:real;
BEGIN
	a:=nil;
	generarVectorIniciarl(v);
	imprimirVector(v);
	generarArbol(a, v);
	writeln('Imprimimos arbol');
	imprimirArbol(a);
	writeln('Ingrese un monto: ');
	readln(monto);
	writeln(diasMenorA(a, monto), ' Dias con menor monto a ',monto);
END.