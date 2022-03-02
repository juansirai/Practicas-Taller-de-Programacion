
{
Realizar un programa que lea números y que utilice un procedimiento recursivo que
escriba el equivalente en binario de un número decimal. El programa termina cuando el
usuario ingresa el número 0 (cero).
Ayuda: Analizando las posibilidades encontramos que: Binario (N) es N si el valor es
menor a 2. ¿Cómo obtenemos los dígitos que componen al número? ¿Cómo achicamos
el número para la próxima llamada recursiva? Ejemplo: si se ingresa 23, el programa
debe mostrar: 10111.
}

program ejercicio7;

procedure binario(n:integer);
begin
	if n<2 then
		write(n)
	else begin
		binario(n div 2);
		write(n mod 2);
	end;
end;

VAR
  n:integer;
  result:string;
BEGIN
  write('Ingrese un numero: ');readln(n);
  while n<>0 do begin
    binario(n);
    writeln();
    write('Ingrese un numero: ');readln(n);
  end;
END.
