{En un colegio secundario, cada alumno participa de un proyecto de ciencias. El proyecto de
un alumno pertenece a un tópico (volcanes, vida marina, migración de las aves, etc.). Un
mismo alumno pudo haber presentado más de un proyecto (en distintos tópicos). En la
última hora del evento las personas visitantes pueden votar el proyecto del alumno que más
le gustó.
a. Realice un programa para el sistema de votación. Un voto consiste en el nombre del
alumno y el tópico en el cual pertenece el proyecto.
b. Almacene esta información en una estructura óptima para la búsqueda, ordenada
por nombre de alumno. Para cada alumno almacene todos sus proyectos ordenado
por tópico.
c. Al finalizar la carga (se lee el alumno ‘zzz’) se debe informar:
i. Cual fue el proyecto ganador: nombre del alumno, tópico y cantidad de
votos.
ii. Número de votos totales, es decir la suma de los votos de todos los
proyectos en los que participa un alumno, ordenados alfabéticamente por
nombre de alumno.}

program practica;
CONST
	CORTE = 'ZZZ';
TYPE
	str30 = string[30];
	proyecto = record
		topico:str30;
		votos:integer;
	end;
	listaProyectos = ^nodoP;
	nodoP = record
		elemento:proyecto;
		sig:listaProyectos;
	end;
	alumno = record
		nombre:str30;
		proyectos:listaProyectos;
	end;
	abb = ^nodoA;
	nodoA = record
		elemento:alumno;
		hd:abb;
		hi:abb;
	end;
	voto = record
		alumno:str30;
		topico:str30;
	end;

//----------------cargamos al alumno----------------------------//
procedure insertarOrdenadoP(var pri:listaProyectos; p:proyecto);
var
	ant, act, nue:listaProyectos;
begin
	new(nue); nue^.elemento:= p;
	act:=pri;
	ant:=pri;
	while ((act<> nil) and (act^.elemento.topico<p.topico)) do begin
		ant:=act;
		act:=act^.sig;
	end;
	if(act = ant) then
		pri:=nue
	else
		ant^.sig:=nue;
	nue^.sig:=act;
end;

procedure cargarProyectos(var l:listaProyectos);
var
	pro:proyecto;
begin
	writeln();
	write('Ingrese topico: ');readln(pro.topico);
	while(pro.topico <>CORTE) do begin
		pro.votos:=0;
		insertarOrdenadoP(l, pro);
		write('Ingrese topico: ');readln(pro.topico);
	end;
end;
procedure leerAlumno(var a:alumno);
begin
	write('Nombre Alumno: ');readln(a.nombre);
	if(a.nombre <> CORTE) then begin
		a.proyectos:=nil;
		write('Proyectos en los que participo ( ZZZ para finalizar) ');
		cargarProyectos(a.proyectos);
	end;
end;

procedure arbol(var a:abb; dato:alumno);
begin
	if(a = nil) then begin
		new(a);
		a^.elemento:=dato;
		a^.hd := nil; a^.hi := nil;
	end
	else begin
		if(dato.nombre > a^.elemento.nombre) then
			arbol(a^.hd, dato)
		else
			arbol(a^.hi, dato);
	end;
end;

procedure generarArbol(var a:abb);
var
	alum:alumno;
begin
	a:=nil;
	leerAlumno(alum);
	while(alum.nombre <>CORTE) do begin
		arbol(a, alum);
		leerAlumno(alum);
	end;
end;

procedure imprimirProyectos(l:listaProyectos);
begin
	while(l<>nil) do begin
		write(' Topico: ',l^.elemento.topico,'  -  Votos: ',l^.elemento.votos, '   | ');
		l:=l^.sig;
	end;
	writeln();
end;

procedure imprimirArbol(a:abb);
begin
	if(a<>nil) then begin
		imprimirArbol(a^.hi);
		writeln();
		writeln('Alumno: ',a^.elemento.nombre);
		imprimirProyectos(a^.elemento.proyectos);
		imprimirArbol(a^.hd);
	end;
end;

//---------------------------SISTEMA DE VOTAACION----------------
procedure leerVoto(var v:voto);
begin
	write('Topico: ');readln(v.topico);
	if(v.topico <> CORTE) then begin
		write('Alumno: '); readln(v.alumno);
	end;
end;

procedure modificarProyecto(var p:proyecto);
begin
	p.votos+=1;
end;

procedure buscarEnAlumno(var a:alumno; top:str30);
var
	aux: listaProyectos;
begin
	aux:= a.proyectos;
	while(aux<>nil) and (aux^.elemento.topico < top) do
		aux:=aux^.sig;
	if(aux<>nil) then
		modificarProyecto(aux^.elemento);
end;

procedure aplicarVoto(a:abb; v:voto);
begin
	if(a<>nil) then begin
		if(a^.elemento.nombre = v.alumno) then
			buscarEnAlumno(a^.elemento, v.topico)
		else begin
			if(v.alumno<a^.elemento.nombre) then
				aplicarVoto(a^.hi, v)
			else
				aplicarVoto(a^.hd, v);
		end;
	end;
end;

procedure votar(a:abb);
var
	v:voto;
begin
	leerVoto(v);
	while(v.topico<>CORTE) do begin
		aplicarVoto(a, v);
		leerVoto(v);
	end;
end;

//--------------------------BUSCAR PROYECTO GANADOR------------------------

procedure analizarAlumno(a:alumno; var nombre:str30; var p:proyecto; var maxVotos:integer);
var
	aux:listaProyectos;
begin
	aux:=a.proyectos;
	while(aux<>nil) do begin
		if (aux^.elemento.votos > maxVotos) then begin
			nombre:=a.nombre;
			maxVotos:=aux^.elemento.votos;
			p:=aux^.elemento;
		end;
		aux:=aux^.sig;
	end;
end;

procedure proyectoGanador(a:abb; var nombre:str30; var p:proyecto; var maxVotos:integer);
begin
	if(a<>nil) then begin
		proyectoGanador(a^.hi, nombre, p, maxVotos);
		analizarAlumno(a^.elemento, nombre, p, maxVotos);
		proyectoGanador(a^.hd, nombre, p, maxVotos);
	end;
end;

//-------------LISTADO DE VOTOS TOTALES------------------------

procedure informar(alu:alumno);
var
	aux:listaProyectos;
	total:integer;
begin
	total:=0;
	aux:=alu.proyectos;
	while(aux<>nil) do  begin
		total+= aux^.elemento.votos;
		aux:=aux^.sig;
	end;
	writeln(alu.nombre,' : ',total);
end;

procedure votosTotales(a:abb);
begin
	if(a<>nil) then begin
		votosTotales(a^.hi);
		informar(a^.elemento);
		votosTotales(a^.hd);
	end;
end;

VAR
	a:abb;
	maxVotos:integer;
	nombre:str30;
	p:proyecto;
BEGIN
	maxVotos:=-1;
	generarArbol(a);
	imprimirArbol(a);
	votar(a);
	imprimirArbol(a);
	writeln();
	proyectoGanador(a, nombre, p, maxVotos);
	writeln('El proyecto ganador es del alumno: ', nombre, ' y pertenece a ',p.topico, ' con ',p.votos,' votos');
	writeln();
	writeln('Listado de votos totales: ');
	votosTotales(a);
END.
