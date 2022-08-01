{


* }

program final;
const
	DIMF = 200;
	CORTE = -1; //solo a afectos de carga
type
	categorias = 1..10;
	afiliado = record
		nroAfiliado: integer;
		nroDNI: integer;
		cat: categorias;
		anio: integer;
	end;

	//se dispone de arbol ordenado por nro afiliado
	arbol = ^nodoA;
	nodoA = record
		elemento: afiliado;
		hi: arbol;
		hd: arbol;
	end;

	datoVector = record
		nroAfiliado:integer;
		nroDNI:integer;
	end;
	vector = array[1..DIMF] of datoVector;


// --------------MODULOS ADICIONALES PARA CARGAR ARBOL ------------------//
procedure leerAfiliado(var a:afiliado);
begin
	write('Nro Afiliado: ');readln(a.nroAfiliado);
	if(a.nroAfiliado <> CORTE) then begin
		write('Nro DNI: ');readln(a.nroDNI);
		write('Categoria (1..10)');readln(a.cat);
		write('Anio ingreso: ');readln(a.anio);
	end;
end;

procedure abb(var a:arbol; ele:afiliado);
begin
	if(a = nil) then begin
		new(a);
		a^.elemento:= ele;
		a^.hi:= nil;
		a^.hd:= nil;
	end
	else begin
		if(ele.nroAfiliado < a^.elemento.nroAfiliado) then
			abb(a^.hi, ele)
		else
			abb(a^.hd, ele)
	end;
end;

procedure crearArbol(var a:arbol);
var
	afi:afiliado;
begin
	writeln('Se procede a la carga del arbol: ');
	leerAfiliado(afi);
	while(afi.nroAfiliado <> CORTE) do begin
		abb(a, afi);
		leerAfiliado(afi);
	end;
end;

// ---------------------------- MODULOS DEL FINAL ---------------//
procedure insertarOrdenado (var v:vector; var dimL:integer; d:datoVector);
	var
	 	pos : integer;
	 	i : integer;
begin
	if (dimL < DIMF) then begin
		pos := 1;
		while (pos <= dimL) and (v[pos].nroDNI < d.nroDNI) do
			pos := pos + 1;
		for i := dimL downto pos do
			v[i+1] := v[i];
		v[pos] := d;
		dimL := dimL + 1;
	end;
end;


procedure retornarVector(a:arbol; num1, num2: integer; cat:categorias; var v:vector; var dimL:integer);
var
	dato: datoVector;
begin
	if(a <> nil) then begin
		if((a^.elemento.nroAfiliado>= num1) and (a^.elemento.nroAfiliado <= num2)) then begin
			if(a^.elemento.cat = cat) then begin
			    dato.nroAfiliado:=a^.elemento.nroAfiliado;
			    dato.nroDNI:= a^.elemento.nroDNI;
			    insertarOrdenado(v, dimL, dato);
			end;
		end
		else if (a^.elemento.nroAfiliado<num1) then
			retornarVector(a^.hd, num1, num2, cat, v, dimL)
		else
			retornarVector(a^.hi, num1, num2, cat, v, dimL);
	end;
end;

procedure imprimirArbol(a:arbol);
begin
	if(a<>nil) then begin
		imprimirArbol(a^.hi);
		writeln('Afiliado: ', a^.elemento.nroAfiliado, 'DNI: ', a^.elemento.nroDNI,' Categoria: ',a^.elemento.cat, ' Anio: ',a^.elemento.anio);
		imprimirArbol(a^.hd);
	end;
end;

procedure imprimirVector(v:vector; dimL:integer);
var
	i:integer;
begin
	for i:= 1 to dimL  do
		writeln('Afiliado: ',v[i].nroAfiliado, ' DNI: ',v[i].nroDNI);
end;
//------------- programa principal -----------------//

VAR
	dimL: integer;
	a: arbol;
	v: vector;
	num1, num2:integer;
	cat:categorias;
BEGIN
	dimL:= 0;
	a:= nil;
	crearArbol(a);
	imprimirArbol(a);
	writeln('Creamos el vector: ');
	write('Ingrese nro 1: ');readln(num1);
	write('Ingreso num2: ');readln(num2);
	write('Ingrese categoria: ');readln(cat);
	retornarVector(a,num1, num2, cat, v, dimL);
	writeln('Imprimimos');
	imprimirVector(v, dimL);
END.
