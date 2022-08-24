program parcial;
CONST
	DIMF = 15;
	CORTE =  0;
	VALORALTO = 99;
TYPE
	compra = record
		dia:integer;
		nroTicket: integer;
		cuil: integer;
		monto: real;
	end;
	
	listaC = ^nodoC;
	nodoC = record
		elemento: compra;
		sig: listaC;
	end;
	
	vectorSucursal = array[1..15] of listaC;
	
	cliente = record
		cuil: integer;
		email: string;
		telefono: string;
	end;
	vectorClientes = array[1..DIMF] of cliente;

{-----------------Auxiliares, solo para testear el programa----------}
procedure generarCliente(var c: cliente);
begin
	write('Cuil: ');readln(c.cuil);
	write('Email: ');readln(c.email);
	write('Telefono: ');readln(c.telefono);
end;

procedure generarVectorClientes(var v:vectorClientes);
var
	c:cliente;
	i:integer;
begin
	writeln('Generamos vector de ',DIMF,' Clientes');
	for i:=1 to DIMF do begin
		writeln('Cliente : ',i);
		generarCliente(c);
		v[i]:= c;
	end;
end;

procedure generarCompra(var c:compra);
begin
	c.dia:= random(31);
	if(c.dia <> CORTE) then begin
		c.nroTicket:= random(2300);
		c.cuil:= random(10);
		c.monto:= random * 10000;
	end;
end;

procedure insertarOrdenado(var pri:listaC; c:compra);
var
	ant,act, nue:listaC;
begin
	new(nue);
	nue^.elemento:=c;
	act:=pri; ant:=pri;
	while (act<>nil) and (act^.elemento.dia < c.dia) do begin
		ant:=act;
		act:= act^.sig;
	end;
	if(act = ant) then
		pri:=nue
	else
		ant^.sig:=nue;
	nue^.sig:=act;
end;

procedure generarVectorSucu(var v:vectorSucursal);
var
	i:integer;
	c:compra;
begin
	for i:=1 to 15 do begin
		v[i]:= nil; //inicializo el puntero
		generarCompra(c);
		while(c.dia<> CORTE) do begin
			insertarOrdenado(v[i], c);
			generarCompra(c);
		end;
	end;
	writeln('Vector de compras cargado con exito');
end;

procedure imprimirListaCompras(l:listaC);
begin
	while(l<>nil) do begin
		writeln('Dia: ', l^.elemento.dia,' nro Ticket ',l^.elemento.nroTicket,' Cuil: ',l^.elemento.cuil,' Monto: ',l^.elemento.monto:1:2);
		l:=l^.sig;
	end;
end;
procedure imprimirSucursales(v:vectorSucursal);
var
	i:integer;
begin
	for i:=1 to 15 do begin
		writeln('Sucursal ',i);
		imprimirListaCompras(v[i]);
	end;
end;

{------------------------INCISO A------------------------------------}
procedure ordenarVectorClientes(var v:vectorClientes);
var
	i, j, p:integer;
	dato:cliente;
begin
	for i:=1 to DIMF-1 do begin
		p:= i;
		for j:= i+1 to DIMF do begin
			if v[j].cuil < v[p].cuil then
				p:=j;
		end;
		dato:=v[p];
		v[p]:= v[i];
		v[i]:=dato;
	end;
end;

procedure imprimirVectorClientes(v:vectorClientes);
var
	i:integer;
begin
	for i:=1 to DIMF do begin
		writeln(i, '- cuil: ',v[i].cuil,' Email: ',v[i].email, ' Telefono ',v[i].telefono);
	end;
end;


{=================================
*                           inciso b
=================================}
procedure calcularMax(dato: compra; var max:compra);
begin
	if(dato.monto > max.monto) then 
		max:=dato;
end;

procedure minimo(var v:vectorSucursal; var min:compra);
var
	i, pos:integer;
begin
	min.dia:=VALORALTO;
	pos:=-1;
	for i:=1 to 15 do begin
		if(v[i] <> nil) and (v[i]^.elemento.dia < min.dia) then begin
			min:= v[i]^.elemento;
			pos:= i;
		end;
	end;
	if (pos<>-1) then
		v[pos]:=v[pos]^.sig;
end;

procedure busquedaDicotomica(nro:integer; var clienteMax:cliente; v:vectorClientes; li,mid, ls:integer);
begin
	if(li<ls) then begin
		if( v[mid].cuil = nro) then
		  clienteMax:= v[mid]
		else begin
			if(v[mid].cuil>nro) then begin
				ls:= mid-1;
				mid:= (li+ls) div 2;
				busquedaDicotomica(nro, clienteMax, v, li, mid, ls);
			end
			else begin
				li:= mid+1;
				mid:= (li+ls) div 2;
				busquedaDicotomica(nro, clienteMax, v, li, mid, ls);
			end;
		end;
	end;
end;

procedure imprimirGanadores( vS:vectorSucursal; vC: vectorClientes);
var
	min, max:compra;
	act:integer;
	clienteMax:cliente;
	ls, li, mid:integer;
begin
	minimo(vS, min);
	ls:=DIMF; li:=1; mid:= (ls+li) div 2;
	while(min.dia <> VALORALTO) do begin
		act:=min.dia;
		max.monto:=-1;
		clienteMax.cuil:= -1;
		while(min.dia<>VALORALTO) and (act= min.dia) do begin
			//actualizo el maximo por dia
			calcularMax(min, max);
			minimo(vS, min);
		end;
		busquedaDicotomica(max.cuil, clienteMax, vC, li, mid, ls);
		if(clienteMax.cuil <> -1) then
			writeln('Maximo dia ',act,' : Ticket: ', max.nroTicket, ' monto: ',max.monto:1:2,' CUIL: ',clienteMax.cuil,' Email: ',clienteMax.email)
		else
			writeln('Maximo dia ',act,' : Ticket: ', max.nroTicket, ' Premio vacante')
	end;
end;

VAR
	v:vectorSucursal;
	v2: vectorClientes;
BEGIN
	generarVectorSucu(v);
	imprimirSucursales(v);
	generarVectorClientes(v2);
	ordenarVectorClientes(v2);
	imprimirVectorClientes(v2);
	imprimirGanadores(v, v2);
END.
