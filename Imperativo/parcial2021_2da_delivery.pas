program parcial;
CONST
	CORTE = -1;
TYPE

 // Lista de entregas
	pedido = record
		codigo:integer;
		cantidad:integer;
	end;
	listaM = ^nodoM;
	nodoM = record
		elemento : pedido;
		sig:listaM;
	end;
	entrega = record
		codigo:integer;
		dni: integer;
		menus:listaM;
	end;
	listaE = ^nodoE;
	nodoE = record
		elemento : entrega;
		sig:listaE;
	end;
	
	//arbol de menus
	menu = record
		codigo:integer;
		stock:integer;
	end;
	abb = ^nodoA;
	nodoA = record
		elemento: menu;
		hd: abb;
		hi: abb;
	end;
	
	listaStock = ^nodoI;
	nodoI = record
		elemento:integer;
		sig:listaStock;
	end;
	
{****************************
* Carga de estructuras iniciales
* ***************************}
procedure cargarPedido(var p:pedido);
begin
	p.codigo:=random(100)-1;
	if(p.codigo <>CORTE) then
		p.cantidad:= random(10);
end;

procedure insertarAdelante(var pri:listaM; p:pedido);
var
	nue:listaM;
begin
	new(nue);
	nue^.elemento:=p;
	nue^.sig:=pri;
	pri:=nue;
end;

procedure generarListaMenu(var pri: listaM);
var
	p:pedido;
begin
	cargarPedido(p);
	while(p.codigo <> CORTE) do begin
		insertarAdelante(pri, p);
		cargarPedido(p);
	end;
end;

procedure cargarEntrega(var e:entrega);
begin
	e.codigo:= random(100)-1;
	if(e.codigo<>CORTE) then begin
		e.dni := random(1000);
		e.menus:= nil;
		generarListaMenu(e.menus);
	end;
end;

procedure insertarAdelante2(var pri:listaE; e:entrega);
var
	nue:listaE;
begin
	new(nue);
	nue^.elemento:=e;
	nue^.sig:=pri;
	pri:=nue;
end;

procedure generarListaEntregas(var e:listaE);
var
	dato:entrega;
begin
	cargarEntrega(dato);
	while(dato.codigo<>CORTE) do begin
		insertarAdelante2(e, dato);
		cargarEntrega(dato);
	end;
end;

procedure imprimirMenus(pri:listaM);
begin
	while(pri<>nil) do begin
		writeln('Codigo: ', pri^.elemento.codigo,' Cantidad : ',pri^.elemento.cantidad);
		pri:= pri^.sig;
	end;
end;

procedure imprimirEntregas(pri:listaE);
begin
	while(pri<>nil) do begin
		writeln('Codigo: ', pri^.elemento.codigo, ' DNI: ', pri^.elemento.dni, ' Menus: ');
		imprimirMenus(pri^.elemento.menus);
		writeln();
		pri:=pri^.sig;
	end;
end;

{arbol de menus}
procedure generarMenu(var m:menu);
begin
	m.codigo:=random(100)-1;
	if(m.codigo<>CORTE) then
		m.stock:=random(1000);
end;

procedure arbol(var a:abb; m:menu);
begin
	if(a=nil) then begin
		new(a);
		a^.elemento:=m;
		a^.hd:=nil; a^.hi:=nil;
	end
	else begin
		if(m.codigo = a^.elemento.codigo) then 
			a^.elemento.stock+=m.stock
		else begin
			if(m.codigo <a^.elemento.codigo) then
				arbol(a^.hi, m)
			else
				arbol(a^.hd, m);
		end;
	end;
end;

procedure generarArbol(var a:abb);
var
	m:menu;
begin
	generarMenu(m);
	while(m.codigo <>CORTE) do begin
		arbol(a, m);
		generarMenu(m);
	end;
end;

procedure imprimirArbol(a:abb);
begin
	if(a<>nil) then begin
		imprimirArbol(a^.hi);
		writeln('Codigo: ',a^.elemento.codigo, ' Stock: ', a^.elemento.stock);
		imprimirArbol(a^.hd);
	end;
end;


//Inciso a
procedure actualizarArbol(var a:abb; dato:pedido);
begin
	if(a=nil) then begin
		new(a);
		a^.elemento.codigo:=dato.codigo;
		a^.elemento.stock:=0;
		a^.hd:=nil; a^.hi:=nil;
	end
	else begin
		if(a^.elemento.codigo = dato.codigo) then
			a^.elemento.stock -= dato.cantidad
		else begin
			if(dato.codigo < a^.elemento.codigo) then
				actualizarArbol(a^.hi, dato)
			else
				actualizarArbol(a^.hd, dato);
		end;
	end;
end;
procedure analizarLista(var a:abb; pri:listaM);
begin
	if(pri<>nil) then begin
		actualizarArbol(a, pri^.elemento);
		analizarLista(a, pri^.sig);
	end;
end;
procedure actualizarRecursivo(var a:abb; e:listaE);
begin
	if(e<>nil) then begin
		analizarLista(a, e^.elemento.menus);
		actualizarRecursivo(a, e^.sig);
	end;
end;


{INCISO B}
procedure agregar(var pri:listaStock; dato:integer);
var
	nue:listaStock;
begin
	new(nue);
	nue^.elemento:=dato;
	nue^.sig:=pri;
	pri:=nue;
end;

procedure generarListaStock(var a:abb; var pri:listaStock; num1, num2: integer);
begin
	if(a<>nil) then begin
		if(a^.elemento.codigo < num1) then begin
			if(a^.elemento.stock = num2) then
				agregar(pri, a^.elemento.codigo);
			generarListaStock(a^.hi, pri, num1, num2);
			generarListaStock(a^.hd, pri, num1, num2);
		end
		else
			generarListaStock(a^.hi, pri, num1, num2);
	end;
end;

procedure imprimirResultado(pri:listaStock);
begin
	while(pri<>nil) do begin
		write(' codigo: ',pri^.elemento,'| ');
		pri:=pri^.sig;
	end;
end;

VAR
	entregas:  listaE;
	a:abb;
	pri:listaStock;
	num1, num2:integer;
BEGIN
	a:=nil;
	entregas:=nil;
	pri:=nil;
	generarListaEntregas(entregas);
	imprimirEntregas(entregas);
	generarArbol(a);
	writeln('Imprimimos arbol');
	imprimirArbol(a);
	actualizarRecursivo(a, entregas);
	imprimirArbol(a);
	writeln('Ingrese numero 1: ');readln(num1);
	writeln('Stock a igualar: ');readln(num2);
	generarListaStock(a, pri, num1, num2);
	imprimirResultado(pri);
END.