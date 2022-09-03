program finalMoto;
const
	CORTE = 'ZZZ';
type
	str30 = string[30];
	pedido = record	
		nroRepartidor : integer;
		dirRetiro: str30;
		dirEntrega: str30;
		monto: real;
	end;
	
	datoA = record
		nroRepartidor:integer;
		cantidad:integer;
		monto:real;
	end;
	abb = ^nodo;
	nodo = record
		elemento: datoA;
		hi: abb;
		hd: abb;
	end;

procedure leerPedido(var p:pedido);
begin
	write('Direccion entrega: ');readln(p.dirEntrega);
	if(p.dirEntrega <> CORTE) then begin
		write('Dir retiro: ');readln(p.dirRetiro);
		write('Nro Repartidor: ');readln(p.nroRepartidor);
		write('Monto: ');readln(p.monto);
	end;
end;

procedure arbol(var a:abb; dato:pedido);
begin
	if(a=nil) then begin
		new(a);
		a^.elemento.nroRepartidor:= dato.nroRepartidor;
		a^.elemento.cantidad:= 1;
		a^.elemento.monto:= dato.monto;
		a^.hd:= nil; a^.hi:= nil;
	end
	else begin
		if(a^.elemento.nroRepartidor = dato.nroRepartidor) then begin
			a^.elemento.cantidad+=1;
			a^.elemento.monto+= dato.monto;
		end
		else begin
				if(dato.nroRepartidor<a^.elemento.nroRepartidor) then
					arbol(a^.hi, dato)
				else
					arbol(a^.hd, dato);
		end;
	end;
end;

procedure crearEstructura(var a:abb);
var
	p: pedido;
begin
	leerPedido(p);
	while(p.dirEntrega <> CORTE) do begin
		arbol(a, p);
		leerPedido(p);
	end;
	writeln('Arbol cargado satisfactoriamente');
end;

procedure imprimir(a:abb);
begin
	if(a<>nil) then begin
		imprimir(a^.hi);
		writeln('Codigo: ', a^.elemento.nroRepartidor, ' Cantidad: ', a^.elemento.cantidad, ' Monto: ', a^.elemento.monto:1:2);
		imprimir(a^.hd);
	end;
end;


function incisoA(a:abb; uno, dos: real):integer;
begin
	if (a = nil) then
		incisoA:=0
	else begin
		if(a^.elemento.monto <= dos) and (a^.elemento.monto>=uno) then
			incisoA:= 1 + incisoA(a^.hi, uno, dos) + incisoA(a^.hd, uno, dos)
		else
			incisoA:= incisoA(a^.hi, uno, dos) + incisoA(a^.hd, uno, dos);
	end;
end;

procedure incisoB(a: abb; uno, dos:real);
begin
	if(a<>nil) then begin
		if(a^.elemento.nroRepartidor <= dos) and (a^.elemento.nroRepartidor >= uno) then begin
			writeln('Codigo: ', a^.elemento.nroRepartidor, ' Cantidad: ', a^.elemento.cantidad, ' Total: ', a^.elemento.monto:1:2);
			incisoB(a^.hi, uno, dos);
			incisoB(a^.hd, uno, dos);
		end
		else begin
			if(a^.elemento.nroRepartidor>dos) then
				incisoB(a^.hi, uno, dos)
			else
				incisoB(a^.hd, uno, dos);
		end;
	end;
end;

var
	a:abb;
	uno, dos: real;
	u, d:integer;
begin
	a:=nil;
	crearEstructura(a);
	imprimir(a);
	writeln('Monto uno: ');
	readln(uno);
	writeln('Monto dos: ');
	readln(dos);
	writeln('Resultado inciso a: ', incisoA(a, uno, dos));
	writeln('Nro repa uno');
	readln(u);
	writeln('Nro repa dos');
	readln(d);
	incisoB(a, u, d);
end.
