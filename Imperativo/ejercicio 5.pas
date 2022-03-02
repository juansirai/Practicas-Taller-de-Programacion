{5. Escribir un programa que:
a. Implemente un módulo que genere un vector de 20 números enteros.
b. Implemente un módulo recursivo que devuelva el máximo valor del vector.
c. Implementar un módulo recursivo que devuelva la suma de los valores contenidos
en el vector}
{5. Escribir un programa que:
a. Implemente un módulo que genere un vector de 20 números enteros.
b. Implemente un módulo recursivo que devuelva el máximo valor del vector.
c. Implementar un módulo recursivo que devuelva la suma de los valores contenidos
en el vector}
program ejercicio5;
CONST
  DIMF = 20;
TYPE
  vector = array[1..DIMF] of integer;



{----------------------------------------------------------
                          MODULOS
-----------------------------------------------------------}
// TODO: Implemente un módulo que genere un vector de 20 números enteros.
procedure generarVector(var v:vector);
var i:integer;
begin
  for i:=1 to DIMF do
    v[i]:=random(300);
end;

procedure imprimirVector(v:vector);
var i:integer;
begin
  for i:=1 to DIMF do
    write('-',v[i], '-');
end;

// TODO: b. Implemente un módulo recursivo que devuelva el máximo valor del vector.
function max(m, num:integer):integer;
begin
  if num>m then
    m:=num;
  max:=m;
end;

function buscarMax(v:vector; i:integer; M:integer):integer;
begin
  if i=DIMF then
	buscarMax:=max(M, v[i])
  else
	buscarMax:= buscarMax(v, i+1, max(M, v[i]));
end;

function minimo(m, num:integer):integer;
begin
  if num<m then
    m:=num;
  minimo:=m;
end;

function buscarMin(v:vector; i:integer; M:integer):integer;
begin
  if i=DIMF then
	buscarMin:=minimo(M, v[i])
  else
	buscarMin:= buscarMin(v, i+1, minimo(M, v[i]));
end;


// TODO:  Implementar un módulo recursivo que devuelva la suma de los valores contenidos
function sumatoria(v:vector; i:integer):integer;
begin
  if i=DIMF then
    sumatoria:=v[i]
  else
    sumatoria:=v[i]+sumatoria(v, i+1);
end;

{----------------------------------------------------------
                      PROGRAMA PRINCIPAL
-----------------------------------------------------------}

VAR
  v:vector;
  m:integer;
  i:integer;
  min:integer;
  j:integer;
BEGIN
  m:=-1;
  i:=0;
  j:=1;
  min:=999;
  generarVector(v);
  imprimirVector(v);
  writeln();
  writeln('max: ', buscarMax(v, i, m));
  writeln();
  writeln('min: ', buscarMin(v, i, min));
  writeln();
  writeln('Suma: ', sumatoria(v, j));
END.
