program parcial;
CONST
	DIMF = 10000;
	CORTE = -1;
TYPE
	reserva = record
		dni:integer;
		codigo:integer;
		cantidad:integer;
	end;
	vector = array[1..DIMF] of reserva;
	
	evento = record
		codigo:integer;
		stock:integer;
	end;
	abb = ^nodo;
	nodo = record
		elemento: evento;
		hd:abb;
		hi:abb;
	end;

{AUXILIAR: CARGA DE MODULOS QUE SE DISPONEN}
procedure generarReserva(var r:reserva);
begin
	r.dni:= random(3000)+1;
	r.codigo:= random(3000);
	r.cantidad:= random(20);
end;

procedure generarVector(var v:vector);
var
	i:integer;
	r:reserva;
begin
	for i:=1 to DIMF do begin
		generarReserva(r);
		v[i]:=r;
	end;
end;

procedure generarEvento(var e:evento);
begin
	e.codigo:= random(3000)-1;
	if e.codigo <> CORTE then
		e.stock:= random(10000);
end;

procedure arbol(var a:abb; e:evento);
begin
	if(a=nil) then begin
		new(a);
		a^.elemento:=e;
		a^.hd:=nil; a^.hi:=nil;
	end
	else
		if(e.codigo = a^.elemento.codigo) then
			a^.elemento.stock+=e.stock
	else begin
		if(e.codigo < a^.elemento.codigo) then
			arbol(a^.hi, e)
		else
			arbol(a^.hd, e);
	end;
end;

procedure generarArbol(var a:abb);
var
	e:evento;
begin
	generarEvento(e);
	while(e.codigo<>CORTE) do begin
		arbol(a, e);
		generarEvento(e);
	end;
end;

procedure imprimirVector(v:vector);
var
	i:integer;
begin
	writeln('Vector Reservas: ');
	for i:= 1 to DIMF do
		writeln('DNI: ', v[i].dni, ' Codigo: ',v[i].codigo, ' Cantidad: ',v[i].cantidad);
end;

procedure imprimirArbol(a:abb);
begin
	if(a<>nil) then begin
		imprimirArbol(a^.hi);
		writeln('Codigo: ',  a^.elemento.codigo, ' Stock: ',  a^.elemento.stock);
		imprimirArbol(a^.hd);
	end;
end;

{INCISO A: ORDENAR VECTOR}
procedure ordenarVector(var v:vector);
var
	i, j, p:integer;
	dato:reserva;
begin
	for i:=1 to DIMF-1 do begin
		p:=i;
		for j:=i+1 to DIMF do
			if(v[j].codigo < v[i].codigo) then
				p:=j;
		dato:=v[p];
		v[p]:= v[i];
		v[i]:=dato;
	end;	
end;

{INCISO B- ACTUALIZARARBOL}
procedure actualizaNodo(var a:abb; r:reserva);
begin
	if(a=nil) then begin
	//si por algun motivo no existia, queda en cero (o negativo...)
		new(a);
		a^.elemento.codigo:=r.codigo;
		a^.elemento.stock:=0;
		a^.hd:=nil; a^.hi:=nil;
	end
	else
		if(r.codigo = a^.elemento.codigo) then
			a^.elemento.stock-=r.cantidad //resta el stock
	else begin
		if(r.codigo < a^.elemento.codigo) then
			actualizaNodo(a^.hi, r)
		else
			actualizaNodo(a^.hd, r);
	end;
end;

procedure actualizarArbol(v:vector; var a:abb);
var
	i:integer;
	actual:reserva;
begin
	i:=1;
	while(i<=DIMF) do begin
		actual.codigo:=v[i].codigo;
		actual.cantidad:=0;
		while(i<= DIMF) and (actual.codigo = v[i].codigo) do begin
			actual.cantidad+=v[i].cantidad;
			i+=1;
		end;
		actualizaNodo(a, actual);
	end;
end;


{PROGRAMA PRINCIPAL}
VAR	
	v:vector;
	a:abb;
BEGIN
	a:=nil;
	generarVector(v);
	imprimirVector(v);
	generarArbol(a);
	writeln();
	writeln('Imprimimos arbol');
	imprimirArbol(a);
	ordenarVector(v);
	imprimirVector(v);
	actualizarArbol(v, a);
	writeln();
	writeln('Imprimimos arbol');
	imprimirArbol(a);
END.
