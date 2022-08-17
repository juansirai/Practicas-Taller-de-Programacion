PROGRAM parcial;
CONST
	DIMF = 200; //MAX VENTAS DE CADA SUCURSAL
	CORTE = -1;
	VALORALTO = 9999;
TYPE
	venta = record
		cod_prod: integer;
		cant: integer;
		monto:real;
	end;

	vectorVentas = array[1..DIMF] of venta;
	recordSucu = record
		ventas:vectorVentas;
		dimL:integer;
	end;
	vectorSucursales = array[1..5] of recordSucu;

	datoLista = record
		cod_prod:integer;
		total:integer;
	end;
	lista = ^nodo;
	nodo = record
		elemento: datoLista;
		sig:lista;
	end;
	vectorPunteros = array[1..5] of integer;
//----------PROCEDIMIENTOS-----------

//  Carga inicial
procedure leerVenta(var v:venta);
begin
	write('Cod_prod:');readln(v.cod_prod);
	if(v.cod_prod<>CORTE) then begin
		write('Cantidad: ');readln(v.cant);
		write('Monto: ');readln(v.monto);
	end;
end;

procedure cargarSucu(var vector:recordSucu; dato:venta);
begin
	with vector do begin
		ventas[dimL+1] := dato;
		dimL+=1;
	end;
end;

procedure generarVector(var v:vectorSucursales);
var
	dato: venta;
	i:integer;
begin
	//inicializo dimensiones logicas
	for i:=1 to 5 do begin
		v[i].dimL := 0;
		writeln('Comenzamos la carga de sucursal ',i);
		writeln();
		leerVenta(dato);
		while ((dato.cod_prod <> CORTE) and (v[i].dimL< DIMF)) do begin
			cargarSucu(v[i], dato);
			leerVenta(dato);
		end;
	end;
end;

//-------------------INCISO A - Merge Acumulador ----------------------------
procedure insertarFinal(var pri, ult:lista; dato:datoLista);
var
	nue : lista;
begin
	new(nue);nue^.elemento:=dato;nue^.sig:=nil;
	if(pri = nil) then
		pri:=nue
	else
		ult^.sig:=nue;
	ult:=nue;
end;

procedure minimo(var v:vectorSucursales; var min:datoLista; var p:vectorPunteros);
var
	i, pos:integer;
begin
	min.cod_prod:= VALORALTO;
	pos:=-1;
	for i:=1 to 5 do begin
		if ((p[i] <= v[i].dimL) and (v[i].ventas[p[i]].cod_prod<min.cod_prod)) then begin
			min.cod_prod:=v[i].ventas[p[i]].cod_prod;
			pos:=i;
		end;
	end;
	if(pos <> -1) then begin
		min.total:= v[pos].ventas[p[pos]].cant;
		p[pos]:= p[pos]+1;
	end;
end;

procedure merge(var pri, ult:lista; v:vectorSucursales);
var
	min, actual:datoLista;
	punteros:vectorPunteros;
	i:integer;
begin
	//seteo los punteros en 1
	for i:=1 to 5 do
		punteros[i]:=1;
	minimo(v, min, punteros);
	while(min.cod_prod <> VALORALTO) do begin
		actual.cod_prod:= min.cod_prod;
		actual.total:=0;
		while ((min.cod_prod <> VALORALTO) and (min.cod_prod = actual.cod_prod)) do begin
			actual.total:= actual.total + min.total;
			minimo(v, min, punteros);
		end;
		writeln('Cod: ', actual.cod_prod,' Total: ', actual.total);
		insertarFinal(pri, ult, actual);
	end;
end;

procedure imprimirLista(l:lista);
begin
	writeln('Imprimimos lista total: ');
	while(l<>nil) do begin
		writeln('Codigo: ',l^.elemento.cod_prod, ' Cantidad: ',l^.elemento.total);
		l:=l^.sig;
	end;
end;


function recursivoMasCincuenta(l:lista):integer;
begin
	if(l = nil) then recursivoMasCincuenta:=0
	else begin
		if (l^.elemento.total >50) then recursivoMasCincuenta:=recursivoMasCincuenta(l^.sig)+1
		else recursivoMasCincuenta:=recursivoMasCincuenta(l^.sig);
	end;
end;
//----------PROGRAMA PRINCIPAL---------
VAR
	pri, ult:lista;
	v:vectorSucursales;
BEGIN
	pri:=nil;
	ult:=nil;

	generarVector(v);
	merge(pri, ult, v);
	imprimirLista(pri);

	writeln('Imprimimos productos con +50: ');
	writeln(recursivoMasCincuenta(pri));
END.
