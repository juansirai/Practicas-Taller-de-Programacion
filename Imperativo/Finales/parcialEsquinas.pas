program parcial;
const
	CORTE = 0;
	VALORALTO = 999;
type
	avenidas = 0..10;
	esquina = record
		numAv: avenidas;
		altura : integer;
		flores: integer;
		papeles:integer;
	end;
	
	listaEsquinas = ^nodoE;
	nodoE = record
		elemento: esquina;
		sig:listaEsquinas;
	end;
	vectorAvenidas = array[1..10] of listaEsquinas;
	
	datoAltura = record
		altura:integer;
		flores:integer;
		papeles:integer;
	end;
	listaConsolidada = ^nodoL;
	nodoL = record
		elemento: datoAltura;
		sig: listaConsolidada;
	end;
		
{  GENERACION DE ESTRUCTURA INICIAL}
procedure generarEsquina(var e:esquina);
begin
	e.numAv:= random(958) mod 10;
	if(e.numAv <>CORTE) then begin
		e.altura:= random(10);
		e.flores:= random(200);
		e.papeles:= random(200);
	end;
end;
procedure insertarOrdenado(var pri:listaEsquinas; e:esquina);
var
	ant, act, nue: listaEsquinas;
begin
	new(nue);
	nue^.elemento:=e;
	act:=pri;
	ant:=pri;
	while(act <> nil) and (act^.elemento.altura< e.altura) do begin
		ant:= act;
		act:= act^.sig;
	end;
	if(ant = act) then
		pri:=nue
	else
		ant^.sig:=nue;
	nue^.sig:=act;
end;

procedure imprimirLista(pri: listaEsquinas);
begin
	while(pri<>nil) do begin
		writeln('Numero Av: ', pri^.elemento.numAv, ' Altura: ', pri^.elemento.altura, ' Flores: ', pri^.elemento.flores, ' Papeles: ', pri^.elemento.papeles);
		pri:= pri^.sig;
	end;
end;

procedure generarAvenidas(var v:vectorAvenidas);
var
	e:esquina;
	i:avenidas;
begin
	for i:=1 to 10 do 
		v[i]:= nil; //inicializo los punteros
	generarEsquina(e);
	while(e.numAv <> CORTE) do begin
		insertarOrdenado(v[e.numAv], e);
		generarEsquina(e);
	end;	
	writeln('Vector generado con exito: ');
	for i:=1 to 10 do begin
		writeln('Avenida ', i);
		imprimirLista(v[i]);
	end;
end;

{inciso b}
procedure insertarAtras(var l:listaConsolidada; dato:datoAltura);
var
        aux, act : listaConsolidada;
begin
        new(aux);
        aux^.elemento := dato;
        aux^.sig := nil;
        if (l <> nil) then begin
            act:=l;
            while (act^.sig <> nil) do
                act:=act^.sig;
            act^.sig:=aux;
        end
        else
            l:=aux;
end;

procedure minimo(var v:vectorAvenidas; var min:esquina);
var
	pos, i:integer;
begin
	pos:= -1;
	min.altura:= VALORALTO;
	for i:=1 to 10 do begin
		if(v[i] <> nil) then
			if(v[i]^.elemento.altura < min.altura) then begin
				pos:=i;
				min.altura:= v[i]^.elemento.altura;
			end;
	end;
	if(pos<> -1) then begin
		min:= v[pos]^.elemento;
		v[pos]:= v[pos]^.sig;
	end;
end;

procedure mergeAcumulador(v:vectorAvenidas; var pri:listaConsolidada);
var
	min:esquina;
	dato: datoAltura;
begin
	minimo(v, min);
	while(min.altura <> VALORALTO) do begin
		dato.altura:= min.altura;
		dato.flores:= 0;
		dato.papeles:= 0;
		while(min.altura<> VALORALTO) and (min.altura = dato.altura) do begin
			dato.flores+= min.flores;
			dato.papeles += min.papeles;
			minimo(v, min);
		end;
		insertarAtras(pri, dato);
	end;
	writeln('Generado el merge');
end;

procedure imprimirFinal(l:listaConsolidada);
begin
	while(l<>nil) do begin
		writeln('Altura: ', l^.elemento.altura,' Flores: ', l^.elemento.papeles,' Papeles: ', l^.elemento.papeles);
		l:= l^.sig;
	end;
end;

{**********************
* 	PROGRAMA PRINCIPAL
* *********************}
var
	v:vectorAvenidas;
	pri:listaConsolidada;
begin
	pri:= nil;
	generarAvenidas(v);
	mergeAcumulador(v, pri);
	imprimirFinal(pri);
end.
