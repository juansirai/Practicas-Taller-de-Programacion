{


* }

PROGRAM repaso;

CONST
	CANTSUCU = 5;
	DIMF = 200;
	CORTE = -1; //COD PRODUCTO CORTE
TYPE
	venta = record
		cod:integer;
		cant:integer;
		monto:real;
	end;

	vectorVentas = array[1..DIMF] of venta;
	vectorDIML = array[1..CANTSUCU] of integer;
	vectorSucursales = array[1..CANTSUCU] of vectorVentas;

	resumen = record
		cod:integer;
		cant:integer;
	end;
	lista = ^nodo;
	nodo = record
		elemento:resumen;
		sig:lista;
	end;

//---------------CARGA DE LOS REGISTROS------------------------------//
procedure cargarVenta(var v:venta);
begin

	write('Codigo: ');v.cod:= Random(1000)-1;
	if(v.cod <> CORTE) then begin
		write('Cantidad: ');v.cant:=Random(3000);
		write('Monto: ');v.monto:=Random * 1000;
	end;
end;

procedure cargarVector(var v:vectorVentas; var dimL:integer ; dato:venta);
// para poder generarlo de forma random, hacemos la carga ordenada.
var
	i, j: integer;
begin
	i:=1;
	if(dimL<DIMF) then begin
		while((v[i].cod<dato.cod) and (i<=dimL)) do
			i+= 1;
		for j:=dimL downto i do
			v[j+1]:= v[j];
		v[i]:=dato;
		dimL:=dimL+1;
	end;
end;


procedure cargarSucursales(var v:vectorSucursales; var dimL: vectorDIML);
var
	dato:venta;
	continua:boolean;
	i: integer;
begin
	for i:=1 to CANTSUCU do
		dimL[i]:= 0;
	for i:=1 to CANTSUCU do begin
		writeln('Bienvenido a la carga del vector de la sucursal ',i);
		cargarVenta(dato);
		continua:= true;
		while((dato.cod <> CORTE) and continua) do begin
			cargarVector(v[i] , dimL[i] , dato);
			continua:= dimL[i] < DIMF;
			cargarVenta(dato);
		end;
	end;
end;

procedure imprimirSucursales(v: vectorSucursales; dimL: vectorDIML);
var
	i: integer;
	j: integer;
begin
	for i:=1 to CANTSUCU do begin
		writeln('Datos de sucursal ',i);
		for j:=1 to dimL[i] do
			writeln('Cod: ',v[i][j].cod,' | Cantidad: ',v[i][j].cant,' | Monto: ',v[i][j].monto:1:2);
	end;
end;

//--------------------INCISO A - MERGE ACUMULADOR--------------//

procedure insertar(var l, ult:lista; dato: resumen);
var
	nue :lista;
begin
	new(nue);
	nue^.elemento:=dato;
	nue^.sig:=nil;
	if(l=nil) then
		l:=nue
	else
		ult^.sig:=nue;
	ult:=nue;
end;


procedure minimo(v:vectorSucursales; dimL:vectorDIML; var punta:vectorDIML; var min:venta);
var
	i, pos:integer;
begin
	pos:=-1;
	min.cod:= 9999;
	for i:=1 to CANTSUCU  do begin
		if(punta[i] <= dimL[i]) then begin
			if(v[i][punta[i]].cod < min.cod) then begin
				pos:=i;
				min:=v[i][punta[i]];
			end;
		end;
	end;
	if(pos<>-1) then
		punta[pos]:=punta[pos]+1;
end;


procedure mergeAcumulador(v:vectorSucursales; dimL:vectorDIML; var lis:lista; var ult:lista);
var
	dato: resumen;
	min:venta;
	codActual: integer;
	cantTotal: integer;
	punta: vectorDIML;
	i:integer;
begin
	for i:=1 to CANTSUCU do
		punta[i]:=1;

	minimo(v, dimL, punta, min);
	while(min.cod<>9999) do begin
		codActual:=min.cod;
		cantTotal:=0;
		while(min.cod <> 9999) and (codActual = min.cod) do begin
			writeln('Cod Actual: ',codActual, ' vs Min Cod: ',min.cod);
			cantTotal:= cantTotal + min.cant;
			minimo(v, dimL, punta, min);
		end;
		dato.cod:=codActual;
		dato.cant:= cantTotal;
		insertar(lis, ult, dato);
	end;
end;

procedure imprimirLista(lis:lista);
begin
	while(lis<> nil) do begin
		writeln('Cod: ',lis^.elemento.cod, ' | Cant Total: ',lis^.elemento.cant);
		lis:= lis^.sig;
	end;
end;

function masQuinientas(lis:lista):integer;
begin
	if(lis=nil) then
		masQuinientas:= 0
	else if (lis^.elemento.cant>2500) then
		masQuinientas:= 1 + masQuinientas(lis^.sig)
	else
		masQuinientas:= masQuinientas(lis^.sig);
end;

procedure masQuinientasP(lis:lista; var cant:integer);
begin
	if(lis<>nil) then begin
		if(lis^.elemento.cant>2500) then begin
			cant+=1;
			masQuinientasP(lis^.sig, cant)
		end
		else
			masQuinientasP(lis^.sig, cant)
	end;
end;
// -------------------PROGRAMA PRINCIPAL ----------------------------//
VAR
	v:vectorSucursales;
	dimL: vectorDIML;
	lis, ult: lista;
	cant:integer;
BEGIN
	lis:= nil;
	ult:=nil;
	cant:=0;
	cargarSucursales(v, dimL);
	imprimirSucursales(v, dimL);
	mergeAcumulador(v, dimL, lis, ult);
	writeln('Imprimimos lista');
	imprimirLista(lis);
	writeln('Superan las 500 unidades: ', masQuinientas(lis));
	masQuinientasP(lis, cant);
	writeln('Superan las 500 unidades: ', cant);
END.
