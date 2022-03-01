{El administrador de un edificio de oficinas cuenta, en papel, con la información del pago de
las expensas de dichas oficinas.
Implementar un programa modularizado que:
a. Genere un vector, sin orden, con a lo sumo las 300 oficinas que administra. De
cada oficina se ingresa el código de identificación, DNI del propietario y valor de la
expensa. La lectura finaliza cuando se ingresa el código de identificación -1, el cual no se
procesa.
b. Ordene el vector, aplicando el método de inserción, por código de identificación
de la oficina.
c. Ordene }

program practica1;
const
  DIMF = 300; //max oficinas que administra
  CORTE = -1; // cod identificacion de corte
type
  oficina = record
    codId: integer;
    DNI : integer;
    expensas : real;
  end;
  vectorOficina = array[1..DIMF] of oficina;

// -----------------------------------------------------------------
//                                MODULOS
// -----------------------------------------------------------------

procedure cargarOficina(var O:oficina);
begin
  O.codId := random(301)-1;
  if (O.codId <> CORTE) then begin
    O.DNI := random(2000)+100;
    O.expensas := random * 1000;
  end;
end;

procedure cargarVector(var V:vectorOficina; var dimL:integer);
var
  O:oficina;
begin
  dimL:=0;
  cargarOficina(O);
  while (O.codId <> CORTE) and (dimL < DIMF) do begin
    dimL:=dimL+1;
    v[dimL]:=O;
    cargarOficina(O);
  end;
end;


procedure ordenarSeleccion(var v:vectorOficina; dimL:integer);
var
	i, j, p:integer; item:oficina;
begin
	for i:=1 to dimL-1 do begin
		p:=i; //guarda el indice minimo
		for j:=i+1 to dimL do
			if (v[j].codId < v[p].codId) then
				p:=j;
		item:=v[p];
		v[p]:=v[i];
		v[i]:=item;
	end;
end;

procedure ordenarInsercion(var v:vectorOficina; dimL:integer);
var
	i, j:integer; actual:oficina;
begin
	for i:=2 to dimL do begin
		actual:=v[i];
		j:=i-1;
		while (j>0) and (v[j].codId > actual.codId) do begin
			v[j+1]:=v[j];
			j:=j-1;
		end;
		v[j+1]:=actual;
	end;

end;



// -----------------------IMPRESION Auxiliar -----------------------
procedure imprimirOficina(O:oficina);
begin
  writeln('Codigo Id: ', O.codId);
  writeln('DNI: ', O.DNI);
  writeln('Expensas: ', O.expensas:1:2);
  writeln('-----------------------------');
end;

procedure imprimirVector(V:vectorOficina; dimL:integer);
var
  i:integer;
begin
  for i:=1 to dimL do
    imprimirOficina(v[i]);
  writeln('Total elementos: ', dimL);
end;

// -----------------------------------------------------------------
//                   Programa Principal
// -----------------------------------------------------------------
VAR
  V:vectorOficina;
  dimL:integer;
BEGIN
  cargarVector(V, dimL);
  imprimirVector(V, dimL);
  writeln('Ordenamos vector');
  //ordenarSeleccion(V, dimL);
  ordenarInsercion(V, dimL);
  imprimirVector(V, dimL);
END.
