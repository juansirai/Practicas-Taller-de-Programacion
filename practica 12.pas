{Implementar un programa que procese la información de las ventas de productos de una
librería que tiene 4 sucursales. De cada venta se lee fecha de venta, código del producto
vendido, código de sucursal y cantidad vendida. El ingreso de las ventas finaliza cuando se
lee el código de sucursal 0.
Implementar un programa que:
a. Almacene las ventas ordenadas por código de producto y agrupados por sucursal,
en una estructura de datos adecuada.
b. Contenga un módulo que reciba la estructura generada en el punto a y retorne
una estructura donde esté acumulada la cantidad total vendida para cada código de
producto.}

program ejercicio12;
CONST
  CORTE = 0;
TYPE
  sucu = 0..4;
  fechas = record
    dia:integer;
    mes:integer;
    anio:integer;
  end;
  venta = record
    fecha:fechas;
    codProd:integer;
    codSuc:sucu;
    cant:integer;
  end;

  lista = ^nodo;
  nodo = record
    elemento:venta;
    sig:lista;
  end;

  vectorVentas = array[1..4]of lista;


  ventaResumida = record
    codProd:integer;
    cant:integer;
  end;
  lista2 = ^nodo2;
  nodo2 = record
    elemento:ventaResumida;
    sig:lista2;
  end;

{-------------------------------------------------------------------------------------
                                        MODULOS
--------------------------------------------------------------------------------------}
procedure cargarFecha(var f:fechas);
begin
  f.dia:=random(30)+1;
  f.mes:=random(12)+1;
  f.anio:=2022;
end;


procedure cargarVenta(var v:venta);
begin
  readln(v.codSuc);
  if(v.codSuc <> CORTE) then begin
    cargarFecha(v.fecha);
    v.codProd:=random(2000)+1;
    v.cant:=random(1000)+1;
  end;
end;

procedure insertarOrdenado(var l:lista; v:venta);
var
  nue, ant, act:lista;
begin
  new(nue);nue^.elemento:=v;
  act:=l;
  ant:=l;
  while(act<>nil) and (act^.elemento.codProd < v.codProd) do begin
    ant:=act;
    act:=act^.sig;
  end;
  if(act = ant) then
    l:=nue
  else
    ant^.sig:=nue;
  nue^.sig:=act;
end;

procedure iniciarVector(var v:vectorVentas);
var i:sucu;
begin
  for i:=1 to 4 do
    v[i]:=nil;
end;

procedure cargarVector(var v:vectorVentas);
var
  elemento:venta;
begin
  cargarVenta(elemento);
  while(elemento.codSuc <> CORTE) do begin
    insertarOrdenado(v[elemento.codSuc], elemento);
    cargarVenta(elemento);
  end;
end;


procedure imprimirVector(v:vectorVentas);
var
  i:sucu;
begin
  for i:=1 to 4 do begin
    writeln('-.-.-.-.-.-.-.-.-.-.-.-.-.-.--.-.-.-.-.-.-.-.-');
    writeln('Sucursal: ', i);
    writeln('-.-.-.-.-.-.-.-.-.-.-.-.-.-.--.-.-.-.-.-.-.-.-');
    while (v[i]<> nil) do begin
      writeln(v[i]^.elemento.fecha.dia,'/',v[i]^.elemento.fecha.mes,'/',v[i]^.elemento.fecha.anio,' CodProd: ',v[i]^.elemento.codProd,' Cant: ',v[i]^.elemento.cant);
      v[i]:=v[i]^.sig;
    end;
  end;
end;

procedure insertarAtras(var l:lista2;actual:integer; cantTotal:integer);
var
  act, nue, ant:lista2;
begin
  new(nue); nue^.elemento.codProd:=actual; nue^.elemento.cant:=cantTotal;
  act:=l; ant:=l;
  while(act <> nil) do begin
    ant:=act;
    act:=act^.sig;
  end;
  if(act = ant) then
    l:=nue
  else
    ant^.sig:=nue;
  nue^.sig:=act;
end;

procedure minimo(var v:vectorVentas;var min:ventaResumida);
var
  i:sucu;
  iMin:integer;
begin
  min.codProd:=9999; iMin:=-1;
  for i:=1 to 4 do begin
    if v[i]<>nil then begin
      if(v[i]^.elemento.codProd<min.codProd) then begin
        min.cant:=v[i]^.elemento.cant;
        min.codProd:=v[i]^.elemento.codProd;
        iMin:=i;
      end;
    end;
  end;
  if (iMin <> -1) then
    v[iMin]:=v[iMin]^.sig;
end;

procedure merge(v:vectorVentas; var lnue:lista2);
var
  min:ventaResumida;
  actual:integer;
  cantidadTotal:integer;
begin
  lnue:=nil;
  minimo(v, min);
  while(min.codProd <> 9999) do begin
    actual:=min.codProd;
    cantidadTotal:=0;
    while(min.codProd <> 9999) and (actual = min.codProd) do begin
      cantidadTotal:=cantidadTotal + min.cant;
      minimo(v, min)
    end;
    insertarAtras(lnue,actual ,cantidadTotal);
  end;
end;

procedure imprimirLista(l:lista2);
begin
  while(l<> nil) do begin
    writeln('Codigo: ', l^.elemento.codProd, ' - Cantidad: ',l^.elemento.cant);
    l:=l^.sig;
  end;
end;
{-------------------------------------------------------------------------------------
                                    PROGRAMA PRINCIPAL
--------------------------------------------------------------------------------------}

VAR
  v:vectorVentas;
  l:lista2;
BEGIN
  cargarVector(v);
  imprimirVector(v);

  merge(v, l);

  imprimirLista(l);
END.
