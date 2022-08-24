program parcial;
const
	CORTE = -1;
	VALORALTO = 9999;
type
	entrada = record
		dni:integer;
		codPeli:integer;
		asiento:integer;
		monto:real;
	end;
	
	listaPeli = ^nodoP;
	nodoP = record
		elemento: entrada;
		sig:listaPeli;
	end;
	vectorSemanal = array[1..7] of listaPeli;
	
	datoA = record
		codPeli:integer;
		total:integer;
	end;
	abb = ^nodoA;
	nodoA = record
		elemento : datoA;
		hd: abb;
		hi: abb;
	end;


{-----------------modulos que se disponen----------------------}
procedure generarEntrada(var e:entrada);
begin
	e.codPeli:= random(2000)-1;
	if(e.codPeli <> CORTE) then begin
		e.dni:= random(3000)+1;
		e.asiento:= random(200);
		e.monto:= random * 1000;
	end;
end;

procedure insertarOrdenado(var pri:listaPeli; e:entrada);
var
	ant, act, nue:listaPeli;
begin
	new(nue);
	nue^.elemento:=e;
	act:=pri;ant:=pri;
	while(act<>nil) and (act^.elemento.codPeli<e.codPeli) do begin
		ant:=act;
		act:=act^.sig;
	end;
	if(act = ant) then
		pri:=nue
	else
		ant^.sig:=nue;
	nue^.sig:=act;
end;

procedure generarVectorSemanal(var v:vectorSemanal);
var
	dia:integer;
	e:entrada;
begin
	for dia:=1 to 7 do begin
		v[dia]:=nil;
		generarEntrada(e);
		while(e.codPeli<>CORTE) do begin
			insertarOrdenado(v[dia], e);
			generarEntrada(e);
		end;
	end;
end;

procedure imprimirListadoSemanal(l:listaPeli);
begin
	while(l<>nil) do begin
		writeln('Cod Peli: ',l^.elemento.codPeli,' DNI: ',l^.elemento.dni,' Asiento: ',l^.elemento.asiento, ' Monto: ',l^.elemento.monto:1:2);
		l:=l^.sig;
	end;
end;

procedure imprimirVectorSemanal(v:vectorSemanal);
var
	dia:integer;
begin
	for dia:=1 to 7 do begin
		writeln('Dia ',dia);
		imprimirListadoSemanal(v[dia]);
	end;
end;

{=========================================================
*                                        INCISO 1
* =======================================================}
procedure arbol(var a:abb; dato:datoA);
begin
	if(a = nil) then begin
		new(a);
		a^.elemento:= dato;
		a^.hi:=nil; a^.hd:=nil;
	end
	else begin
		if(dato.codPeli < a^.elemento.codPeli) then
			arbol(a^.hi, dato)
		else
			arbol(a^.hd, dato);
	end;	
end;

procedure minimo(var v:vectorSemanal; var min:entrada);
var
	i, pos:integer;
begin
	pos:=-1;
	min.codPeli:=VALORALTO;
	for i:=1 to 7 do begin
		if(v[i] <> nil) then
			if v[i]^.elemento.codPeli < min.codPeli then begin
				min:=v[i]^.elemento;
				pos:=i;
			end;
	end;
	if(pos<>-1) then
		v[pos]:=v[pos]^.sig;
end;

procedure generarArbol(v:vectorSemanal; var a:abb);
var
	dato: datoA;
	min:entrada;
begin
	//TODO: procedimiento minimo
	minimo(v, min);
	while(min.codPeli <> VALORALTO) do begin
		dato.codPeli:=min.codPeli;
		dato.total:=0;
		while(min.codPeli <> VALORALTO) and (dato.codPeli = min.codPeli) do begin
			dato.total+=1;
			minimo(v, min);
		end;
		arbol(a, dato);
	end;
end;

procedure imprimirArbol(a:abb);
begin
	if(a<> nil) then begin
		imprimirArbol(a^.hi);
		writeln('Cod: ',a^.elemento.codPeli,' Total: ',a^.elemento.total);
		imprimirArbol(a^.hd);
	end;
end;


{=================================================
* 							total recursivo
* ================================================}
function totalRecursivo(a:abb; codA, codB:integer):integer;
begin
	if a=nil then totalRecursivo:=0
	else begin
			if(a^.elemento.codPeli>=codA) and (a^.elemento.codPeli<=codB) then begin
				totalRecursivo:= a^.elemento.total + totalRecursivo(a^.hi, codA, codB) + totalRecursivo(a^.hd, codA, codB);
			end
			else begin
				if(a^.elemento.codPeli<codA) then
					totalRecursivo:= totalRecursivo(a^.hd, codA, codB)
				else
					totalRecursivo:= totalRecursivo(a^.hi, codA, codB);
			end;
	end;
end;


VAR
	v:vectorSemanal;
	a:abb;
	codA, codB:integer;
BEGIN
	a:=nil;
	generarVectorSemanal(v);
	imprimirVectorSemanal(v);
	generarArbol(v, a);
	imprimirArbol(a);
	writeln('Codigo A: ');readln(codA);
	writeln('Codigo B: ');readln(codB);
	writeln('Total entre codigos: ',totalRecursivo(a, codA, codB));
END.
