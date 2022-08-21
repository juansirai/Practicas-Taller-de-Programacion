program parcial;
const
	CORTE = 0;
type

	productoL = record
		cod:integer;
		cantidad:integer;
	end;
	listaP = ^nodo;
	nodo = record
		elemento:productoL;
		sig:listaP;
	end;
	pedido = record
		cod:integer;
		dni:integer;
		listaProd:listaP;
	end;

	listaPedidos = ^nodo2;
	nodo2 = record
		elemento: pedido;
		sig: listaPedidos;
	end;

	productoA = record
		cod:integer;
		stock:integer;
	end;
	abb = ^nodoA;
	nodoA = record
		elemento: productoA;
		hi:abb;
		hd:abb;
	end;

	listaStockCero = ^nodoCero;
	nodoCero = record
		elemento:integer;
		sig:listaStockCero;
	end;

// -------------------- AUX PARA CARGAR ESTRUCTURAS ----------------------
procedure leerProductoL(var p:productoL);
begin
	p.cod:= Random(200);
	if(p.cod <> CORTE) then
		p.cantidad:= Random(2) +1;
end;

procedure insertarNodo(var pri:listaP; p:productoL);
// inserto adelante
var
	nuevo:listaP;
begin
	new(nuevo);
	nuevo^.elemento:=p;
	nuevo^.sig:=pri;
	pri:=nuevo;
end;

procedure cargarListaProd(var pri:listaP);
var
	p:productoL;
begin
	pri:=nil;
	leerProductoL(p);
	while(p.cod <> CORTE) do begin
		insertarNodo(pri, p);
		leerProductoL(p);
	end;
	writeln(' Lista cliente generada satisfactoriamente ');
end;

procedure leerPedido(var p:pedido);
begin
	p.cod:= Random(200);
	if(p.cod <> CORTE) then begin
		p.dni:= Random(3000);
		cargarlistaProd(p.listaProd);
	end;
end;

procedure insertarNodoPedidos(var pri:listaPedidos; p:pedido);
// inserto adelante
var
	nuevo:listaPedidos;
begin
	new(nuevo);
	nuevo^.elemento:=p;
	nuevo^.sig:=pri;
	pri:=nuevo;
end;

procedure cargarListaPed(var pri:listaPedidos);
var
	p: pedido;
begin
	pri:=nil;
	leerPedido(p);
	while(p.cod <> CORTE) do begin
		insertarNodoPedidos(pri, p);
		leerPedido(p);
	end;
	writeln('Lista de pedidos cargada satisfactoriamente');
end;

procedure imprimirListaProd(pri: listaP);
begin
	while(pri <> nil) do begin
		write('| Codigo: ', pri^.elemento.cod, ' | cantidad: ', pri^.elemento.cantidad);
		pri:= pri^.sig;
	end;
end;

procedure imprimirListaPedidos(pri:listaPedidos);
begin
	while(pri <> nil) do begin
		writeln('Codigo: ', pri^.elemento.cod, ' | DNI: ', pri^.elemento.dni,' Productos: ');
		imprimirListaProd(pri^.elemento.listaProd);
		writeln();writeln();
		pri:= pri^.sig;
	end;
end;

procedure leerProductoA(var p:productoA);
begin
	p.cod:= Random(200);
	if(p.cod <> CORTE) then
		p.stock:= Random(30000)+1;
end;

procedure arbol(var a:abb; p:productoA);
begin
	if(a=nil) then begin
		new(a);
		a^.elemento:=p;
		a^.hi:=nil;
		a^.hd:=nil;
	end
	else begin
		if(p.cod<a^.elemento.cod) then
			arbol(a^.hi, p)
		else
			arbol(a^.hd, p);
	end;
end;

procedure generarArbol(var a:abb);
var
	p:productoA;
begin
	leerProductoA(p);
	while(p.cod <> CORTE) do begin
		arbol(a, p);
		leerProductoA(p);
	end;
end;

procedure imprimirArbol(a:abb);
begin
	if(a<>nil) then begin
		imprimirArbol(a^.hi);
		writeln('Cod: ', a^.elemento.cod, ' Stock: ',a^.elemento.stock);
		imprimirArbol(a^.hd);
	end;
end;

//--------------------INCISO A--------------------------------------------------
procedure actualizarArbol(var a:abb; p:productoL);
var
	aux:productoA;
begin
	if(a = nil) then begin
		aux.cod:=p.cod;
		aux.stock:=0;
		new(a);
		a^.elemento:=aux;
		a^.hi:=nil; a^.hd:=nil;
	end
	else begin
		if(p.cod = a^.elemento.cod) then
			a^.elemento.stock := a^.elemento.stock - p.cantidad
		else begin
			if(p.cod < a^.elemento.cod) then
				actualizarArbol(a^.hi, p)
			else
				actualizarArbol(a^.hd, p);
		end;
	end;
end;

procedure recorrerPedidos(pri: listaP; var a:abb);
begin
	if(pri<>nil) then begin
		actualizarArbol(a, pri^.elemento);
		recorrerPedidos(pri^.sig, a);
	end;
end;

procedure actualizarStock(var a:abb;  pri:listaPedidos);
begin
	if(pri<>nil) then begin
		recorrerPedidos(pri^.elemento.listaProd, a);
		actualizarStock(a, pri^.sig);
	end;
end;

//--------------------INCISO B-------------------------------------------------
procedure insertarListaCero(var l:listaStockCero; cod:integer);
var
	nue:listaStockCero;
begin
	new(nue);
	nue^.elemento:=cod;
	nue^.sig:=l;
	l:=nue;
end;

procedure productosStockCero(var l:listaStockCero;a:abb; cod1, cod2, stock:integer);
begin
	if(a<>nil) then begin
		if ((a^.elemento.cod>= cod1) and (a^.elemento.cod <= cod2)) then begin
			if(a^.elemento.stock =stock) then
				insertarListaCero(l, a^.elemento.cod);
			productosStockCero(l, a^.hi, cod1, cod2, stock);
			productosStockCero(l, a^.hd, cod1, cod2, stock);
		end
		else begin
			if(cod2 < a^.elemento.cod) then
				productosStockCero(l, a^.hi, cod1, cod2, stock)
			else
				productosStockCero(l, a^.hd, cod1, cod2, stock);
		end;
	end;
end;

procedure imprimirListaStockCero(l:listaStockCero);
begin
	while(l<>nil) do begin
		writeln('Cod: ', l^.elemento);
		l:=l^.sig;
	end;
end;

//------------------- PROGRAMA PRINCIPAL ------------------------------
VAR
	pri:listaPedidos;
	a:abb;
	l: listaStockCero;
	cod1, cod2, stock:integer;
BEGIN
	a:=nil;
	l:=nil;
	cargarListaPed(pri);
	imprimirListaPedidos(pri);
	generarArbol(a);
	imprimirArbol(a);
	actualizarStock(a, pri);
	writeln('Arbol actualizado ');
	imprimirArbol(a);
	writeln('Ingrese cod 1');readln(cod1);
	writeln('Ingrese cod2: ');readln(cod2);
	writeln('Stock igual a: ');readln(stock);
	productosStockCero(l, a, cod1, cod2, stock);
	imprimirListaStockCero(l);
END.
