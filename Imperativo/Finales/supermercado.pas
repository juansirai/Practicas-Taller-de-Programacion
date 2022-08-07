program repaso;
CONST
	CORTE = -1;
	VALORALTO = 9999;
TYPE
	dias = 1..5;
	producto = record
		codProd:integer;
		cant:integer;
		codCliente:integer;
	end;

	listaProductos = ^nodoProductos;
	nodoProductos = record
		elemento:producto;
		sig:listaProductos;
	end;
	vectorSemanal = array[dias] of listaProductos;

	datoA = record
		codProd:integer;
		cant:integer;
	end;
	listaAcumulada = ^nodoA;
	nodoA = record
		elemento: datoA;
		sig: listaAcumulada;
	end;


//-------Genere 5 listas ordenadas por cod de producto(...)-------------
procedure leerProducto(var p:producto);
begin
	p.codProd:= Random(100)-1;
	if(p.codProd <>CORTE) then begin
		p.cant:= Random(1100);
		p.codCliente:=Random(200)+1;
	end;
end;

procedure insertarOrdenado(var pri:listaProductos; p:producto);
var
	act, ant, nue:listaProductos;
begin
	new(nue); nue^.elemento:=p;
	act:=pri;
	ant:=pri;
	while ((act<>nil) and (act^.elemento.codProd<p.codProd)) do begin
		ant:= act;
		act:= act^.sig;
	end;
	if(act = ant) then
		pri:=nue
	else
		ant^.sig:=nue;
	nue^.sig:=act;
end;

procedure generarVector(var v:vectorSemanal);
var
	p:producto;
	i:dias;
begin
	//inicializo los punteros
	for i:=1 to 5 do
		v[i]:=nil;
	leerProducto(p);
	while(p.codProd<> CORTE) do begin
		i:= Random(5)+1; //genero un dia de la semana random para insertar
		insertarOrdenado(v[i], p);
		leerProducto(p);
	end;
	writeln('Carga de productos finalizada con exito');
end;


procedure imprimirLista(l:listaProductos);
begin
	while(l<>nil) do begin
		writeln('Cod Prod: ',l^.elemento.codProd, ' | Cantidad: ',l^.elemento.cant,' | Cod Cliente: ',l^.elemento.codCliente);
		l:=l^.sig;
	end;
end;
procedure imprimirVectorSemanal(v:vectorSemanal);
var
	i:dias;
begin
	for i:=1 to 5 do begin
		writeln('Dia ',i);
		imprimirLista(v[i]);
	end;
end;

//------------------------------GENERAR LISTA CONSOLIDADA-----------------
procedure insertarAtras(var l:listaAcumulada; dato:datoA);
var
	act, nue:listaAcumulada;
begin
	new(nue);
	nue^.elemento:=dato; nue^.sig:=nil;
	if(l=nil) then
		l:=nue
	else begin
		act:=l;
		while(act^.sig<>nil) do
			act:=act^.sig;
		act^.sig:=nue;
	end;
end;


procedure minimo(var v:vectorSemanal; var min:producto);
var
	i, pos:integer;
begin
	pos:=-1;
	min.codProd:=VALORALTO;
	for i:=1 to 5 do begin
		if(v[i]<>nil) then begin
			if(v[i]^.elemento.codProd < min.codProd) then begin
				pos:=i;
				min:=v[i]^.elemento;
			end;
		end;
	end;
	if(pos<>-1) then
		v[pos]:=v[pos]^.sig;
end;

procedure mergeAcumulador(var v:vectorSemanal; var l:listaAcumulada);
var
	min: producto;
	actual:datoA;
begin
	minimo(v, min);
	while(min.codProd<>VALORALTO) do begin
		actual.codProd:= min.codProd;
		actual.cant:=0;
		while(min.codProd<>VALORALTO) and (actual.codProd = min.codProd) do begin
			actual.cant+= min.cant;
			minimo(v,  min);
		end;
		insertarAtras(l, actual);
	end;
end;

procedure imprimirListaFinal(l:listaAcumulada);
begin
	writeln();
	writeln('Imprimiremos la lista final: ');
	while(l<>nil) do begin
		writeln('Cod Prod: ', l^.elemento.codProd,' | Cantidad: ',l^.elemento.cant);
		l:=l^.sig;
	end;
end;

//-----------------------------PRODUCTO MAS VENDIDO-----------------------

procedure maximo(var codM, max:integer; p:datoA);
begin
	if(p.cant>max) then begin
		max:=p.cant;
		codM:=p.codProd;
	end;
end;

procedure prodMasVendido(l:listaAcumulada; var codMax, max:integer);
begin
	if(l<>nil) then begin
		maximo(codMax, max, l^.elemento);
		prodMasVendido(l^.sig, codMax, max);
	end;
end;

// ------------------------------PROGRAMA PRINCIPAL----------------------------
VAR
	v:vectorSemanal;
	l:listaAcumulada;
	codMax, max:integer;
BEGIN
	l:=nil;
	codMax:=-1;
	max:=-1;
	generarVector(v);
	imprimirVectorSemanal(v);
	mergeAcumulador(v, l);
	imprimirListaFinal(l);
	prodMasVendido(l, codMax, max);
	writeln();
	writeln('El producto mas vendido fue: ',codMax);
END.
