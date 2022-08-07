PROGRAM repaso;

CONST
	CORTE = 0; //          monto de corte
TYPE
	str30 = string[30];
	fechas = string[8] ;//        " dd/mm/aa "
	pedido = record
		dni:integer;
		nombre:str30;
		fecha:fechas;
		monto:real;
	end;

	listaInicial = ^nodoI;
	nodoI = record
		elemento:pedido;
		sig:listaInicial;
	end;

	pedidoDetalle = record
		fecha:fechas;
		monto:real;
	end;
	lista = ^nodoL;
	nodoL = record
		elemento:pedidoDetalle;
		sig:lista;
	end;

	elementoA = record
		dni : integer;
		nombre: str30;
		pedidos:lista;
	end;

	abb = ^nodoA;
	nodoA = record
		elemento: elementoA;
		hi:abb;
		hd:abb;
	end;


//-------------------------PROCEDIMIENTOS DE CARGA------------------------
procedure cargarPedido(var p:pedido);
begin
	write('Ingrese monto: ');readln(p.monto);
	if(p.monto <> CORTE) then begin
		write('Fecha: ');readln(p.fecha);
		write('DNI Cliente: ');readln(p.dni);
		write('Nombre: ');readln(p.nombre);
	end;
end;

procedure insertarOrdenadoDetalle(var pri:lista; p:pedido);
var
	act, ant, nue: lista;
	dato: pedidoDetalle;
begin
	dato.fecha:= p.fecha;
	dato.monto:= p.monto;
	new(nue);
	nue^.elemento:= dato;
	act:= pri;
	ant:=pri;
	while((act <> nil) and (act^.elemento.fecha < dato.fecha)) do begin
		ant:= act;
		act:=act^.sig;
	end;
	if(act = ant) then
		pri:=nue
	else
		ant^.sig:=nue;
	nue^.sig:=act;
end;

procedure insertarOrdenadoInicial(var pri:listaInicial; p:pedido);
var
	act, ant, nue: listaInicial;
begin
	new(nue);
	nue^.elemento:= p;
	act:= pri;
	ant:=pri;
	while((act <> nil) and (act^.elemento.dni <p.dni)) do begin
		ant:= act;
		act:=act^.sig;
	end;
	if(act = ant) then
		pri:=nue
	else
		ant^.sig:=nue;
	nue^.sig:=act;
end;

procedure generarListaInicial(var pri:listaInicial);
var
	p:pedido;
begin
	cargarPedido(p);
	while(p.monto <> CORTE) do begin
		insertarOrdenadoInicial(pri, p);
		cargarPedido(p);
	end;
	writeln('Lista inicial cargada satisfactoriamente');
end;


procedure insertarArbol(var arbol:abb; dato: elementoA);
begin
	if(arbol = nil) then begin
		new(arbol);
		arbol^.elemento:=dato;
		arbol^.hi:=nil;
		arbol^.hd:= nil;
	end
	else begin
		if(dato.dni > arbol^.elemento.dni) then
			insertarArbol(arbol^.hd, dato)
		else
			insertarArbol(arbol^.hi, dato);
	end;
end;

procedure imprimirLista(l:lista);
begin
	writeln('Lista de pedidos: ');
	while(l<>nil) do begin
		write('Fecha: ',l^.elemento.fecha,' | Monto: ',l^.elemento.monto:1:2);
		l:=l^.sig;
	end;
end;

procedure generarArbol(var arbol:abb; LI:listaInicial);
var
	dato: elementoA;
	listaPedidos:lista;
begin
	while(LI <> nil) do begin
			listaPedidos:=nil;
			dato.dni:=LI^.elemento.dni;
			dato.nombre:= LI^.elemento.nombre;
			while((LI <> nil) and (dato.dni = LI^.elemento.dni)) do begin
				insertarOrdenadoDetalle(listaPedidos, LI^.elemento);
				//writeln('actual: ',dato.dni ,' Nuevo: ', LI^.elemento.dni);
				LI:=LI^.sig;
			end;
			//writeln('Salgo');
			dato.pedidos:= listaPedidos;	// inserto la lista generada en el elemento del arbol
			//imprimirLista(dato.pedidos);
			insertarArbol(arbol, dato);
	end;
end;

procedure generarEstructuraA(var arbol:abb);
var
	LI:listaInicial;
begin
	LI:= nil;
	generarListaInicial(LI);     //genera la lista de pedidos
	writeln('Procederemos a crear la estructura de arbol: ');
	generarArbol(arbol, LI);
	writeln('Arbol generado satisfactoriamente');
end;



procedure imprimirElemento(dato: elementoA);
begin
	writeln('DNI: ', dato.dni,' | Nombre: ',dato.nombre);
	imprimirLista(dato.pedidos);
	writeln();
end;

procedure imprimirArbol(a:abb);
begin
	if(a<>nil) then begin
		imprimirArbol(a^.HI);
		imprimirElemento(a^.elemento);
		imprimirArbol(a^.hd);
	end;
end;


//------------------------INFORMAR CANT DE CLIENTES CON PEDIDOS EN DETERMINADA FECHA------------------
function existeFecha(fecha:fechas; l:lista):boolean;
var
	encontre:boolean;
begin
	encontre:=false;
	while((l<>nil) and not(encontre)) do begin
		encontre:= l^.elemento.fecha = fecha;
		l:=l^.sig;
	end;
	existeFecha:=encontre;
end;

procedure informarClientes(fecha:fechas; a:abb; var cantidad:integer);
begin
	if(a<>nil) then begin
		informarClientes(fecha, a^.hi, cantidad);
		if(existeFecha(fecha, a^.elemento.pedidos)) then
			cantidad+=1;
		informarClientes(fecha, a^.hd, cantidad);
	end;
end;


//------------------------RESUMEN DE CLIENTE------------------
procedure reportar(dato:elementoA);
var
	montoTotal:real;
	cantPedidos:integer;
	aux:lista;
begin
	montoTotal:=0;
	cantPedidos:=0;
	aux:= dato.pedidos;
	while(aux <> nil) do begin
		montoTotal+=aux^.elemento.monto;
		cantPedidos+=1;
		aux:=aux^.sig;
	end;
	writeln('Nombre: ', dato.nombre, ' | DNI:  ',dato.dni,'| Monto total: ', montoTotal:1:2, ' | Cant pedidos: ',cantPedidos);
end;

procedure resumenCliente(a:abb; dni:integer);
begin
	if(a<>nil) then begin
		if(a^.elemento.dni = dni) then
			reportar(a^.elemento)
		else begin
			if(a^.elemento.dni>dni) then
				resumenCliente(a^.hi, dni)
			else
				resumenCliente(a^.hd, dni)
		end;
	end;
end;


//-------------------------PROGRAMA PRINCIPAL---------------------------------
VAR
	a:abb;
	cant:integer;
	fecha:fechas;
	dni:integer;
BEGIN
	a:=nil;
	generarEstructuraA(a);
	imprimirArbol(a);
	cant:=0;
	writeln();
	write('Ingrese fecha a buscar: ');
	readln(fecha);
	informarClientes(fecha, a, cant);
	writeln('La cantidad de clientes que compraron el ',fecha, ' es de ',cant);
	writeln('Ingrese un DNI a buscar: ');
	readln(dni);
	resumenCliente(a, dni);
END.
