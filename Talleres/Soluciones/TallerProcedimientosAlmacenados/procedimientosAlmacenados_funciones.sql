--Ṕrocedimientos almacenados:

--1. Consulta para obtener un listado de actividades con
--el tiempo planeado para la ejecucion
--Consulta sin optimizar
-- Function consulta 1:
drop function if exists consultaUno();
create or replace function consultaUno()
	returns table(actividad text,tiempo_planeado numeric)
as $$
		select A.nombre_actividad actividad,
		A.horas_plan_actividad tiempo_planeado
		from actividad A;
$$ language 'sql';



--2. Consulta para obtener un listado de los responsables
--con las actividades asignadas
--Funcion consulta 2
drop function if exists consultaDos();
create or replace function consultaDos()
	returns table(responsable text,actividad text)
as $$
	select P.nombre_persona ||' '|| P.apellido_persona responsable,
	A.nombre_actividad actividad
	from persona P inner join actividad A on P.id_persona = A.id_persona ;
$$ language 'sql';	

--3. Consulta para obtener un listado de las actividades que 
--presentaron inconvenientes de tipo bajo
-- Funcion consulta 3:
drop function if exists consultaTres();
create or replace function consultaTres()
	returns table(actividad text)
as $$
	with actividades_inconveniente(id_actividad,id_inconveniente) as 
	(
		select I.id_actividad,I.id_inconveniente
		from inconveniente I inner join tipoinconveniente T on I.id_tipoinconveniente = T.id_tipoinconveniente 
		where T.nombre_tipoinconveniente like 'bajo'
	)
	select distinct A.nombre_actividad as actividad
	from actividades_inconveniente AI 
	inner join actividad A on AI.id_actividad = A.id_actividad ;
$$ language 'sql';
	
	

--4. Consulta para obtener un listado de las actividades que presentaron
--inconvenientes de tipo medio con el tiempo planeado para la ejecución de las actividades
-- Funcion consulta 4:
drop function if exists consultaCuatro();
create or replace function consultaCuatro()
	returns table(actividad text,tiempo_planeado numeric)
as $$
	with actividades_inconveniente(id_actividad,id_inconveniente) as 
	(
		select I.id_actividad,I.id_inconveniente
		from inconveniente I inner join tipoinconveniente T on I.id_tipoinconveniente = T.id_tipoinconveniente 
		where T.nombre_tipoinconveniente like 'medio'
	)
	select distinct A.nombre_actividad actividad, A.horas_plan_actividad tiempo_planeado
	from actividades_inconveniente AI 
	inner join actividad A on AI.id_actividad = A.id_actividad ;
$$ language 'sql';


--5. Consulta para obtener un listado de las actividades que presentaron
--inconvenientes de tipo fuerte con los responsables de cada actividad

-- Funcion consulta 5
drop function if exists consultaCinco();
create or replace function consultaCinco()
	returns table(actividad text, responsable text)
as $$
	with actividades_inconveniente(id_actividad,id_inconveniente) as 
	(
		select I.id_actividad,I.id_inconveniente
		from inconveniente I inner join tipoinconveniente T on I.id_tipoinconveniente = T.id_tipoinconveniente 
		where T.nombre_tipoinconveniente like 'fuerte'
	)
	select distinct A.nombre_actividad actividad,P.nombre_persona || ' ' || P.apellido_persona responsable 
	from actividades_inconveniente AI
	inner join actividad A on AI.id_actividad = A.id_actividad 
	inner join persona P on A.id_persona = P.id_persona;
$$ language 'sql';


select * from consultaCinco();

--6. Consulta para obtener un listado de las actividades que presentaron inconvenientes de cualquier
-- tipo con el calculo del total de tiempo empleado para la actividad
--Funcion consulta 6:
drop function if exists consultaSeis();
create or replace function consultaSeis()
	returns table(actividad text,responsable text)
as $$	
	select A.nombre_actividad actividad, sum (AV.horas_avance) tiempo_empleado
	from actividad A 
	inner join avance AV on A.id_actividad = AV.id_actividad 
	inner join inconveniente I on AV.id_avance = I.id_avance and I.id_actividad = A.id_actividad 
	group by actividad;
$$ language 'sql';


--7. Consulta para obtener un listado de las actividades que presentaron inconvenientes de tipo bajo
-- con los responsables y con el calculo del total de tiempo empleado para las actividades
--Funcion consulta 7
drop function if exists consultaSiete();
create or replace function consultaSiete()
	returns table(actividad text,responsable text,tiempo_empleado numeric)
as $$
	with actividades_inconveniente (id_actividad) as 
	(
		select distinct I.id_actividad 
		from inconveniente I inner join tipoinconveniente TI on I.id_tipoinconveniente = TI.id_tipoinconveniente 
		where TI.nombre_tipoinconveniente like 'bajo'
	)
	select A.nombre_actividad actividad,
	P.nombre_persona || ' ' || P.apellido_persona responsable,
	sum(AV.horas_avance) tiempo_empleado
	from actividades_inconveniente AI inner join actividad A on AI.id_actividad = A.id_actividad 
	inner join avance AV on A.id_actividad = AV.id_actividad 
	inner join persona P on P.id_persona = A.id_persona 
	group by actividad,responsable;
$$ language 'sql';

--8. Consulta para obtener un listado de los responsables con las actividades asignadas
-- que presentaron inconvenientes de tipo medio
--Funcion consulta 8
drop function if exists consultaOcho();
create or replace function consultaOcho()
	returns table(responsable text,actividad text)
as $$
	with actividades_inconveniente(id_actividad,id_inconveniente) as 
	(
		select I.id_actividad,I.id_inconveniente
		from inconveniente I inner join tipoinconveniente T on I.id_tipoinconveniente = T.id_tipoinconveniente 
		where T.nombre_tipoinconveniente like 'medio'
	)
	select P.nombre_persona ||' '|| P.apellido_persona responsable,
	A.nombre_actividad actividad
	from actividades_inconveniente AI 
	inner join actividad A on AI.id_actividad = A.id_actividad
	inner join persona P on P.id_persona = A.id_persona;
$$ language 'sql';


----9 Consulta para obtener in listado de responsables con las actividades asignadas que presentaron
-- inconvenientes de tipo fuerte y con el tiempo planeado para la ejecucion de las actividades
-- Funcion consulta 9:

drop function if exists consultaNueve();
create or replace function consultaNueve()
	returns table(responsable text,actividad text,tiempo_planeado numeric)
as $$ 
	with actividades_inconveniente (id_actividad) as 
	(
		select distinct I.id_actividad 
		from inconveniente I inner join tipoinconveniente TI on I.id_tipoinconveniente = TI.id_tipoinconveniente 
		where TI.nombre_tipoinconveniente like 'fuerte'
	)
	select distinct(P.nombre_persona || ' ' || P.apellido_persona)responsable,
	A.nombre_actividad actividad,
	A.horas_plan_actividad tiempo_planeado
	from actividades_inconveniente AI inner join actividad A on AI.id_actividad = A.id_actividad 
	inner join avance AV on A.id_actividad = AV.id_actividad 
	inner join persona P on P.id_persona = A.id_persona ;
$$ language 'sql';
	
	
	
--10. Consulta para obtener un listado de los responsables con las actividades asignadas que
-- presentaron inconvenientes de tipo bajo o fuerte, con el calculo total de tiempo empleado para las actividades
-- Funcion consulta 10:
drop function if exists consultaDiez();
create or replace function consultaDiez()
	returns table(actividad text,responsable text,tiempo_empleado numeric)
as $$
	with actividades_inconveniente (id_actividad) as 
	(
		select distinct I.id_actividad 
		from inconveniente I inner join tipoinconveniente TI on I.id_tipoinconveniente = TI.id_tipoinconveniente 
		where TI.nombre_tipoinconveniente in ('bajo','fuerte')
	)
	select A.nombre_actividad actividad,
	P.nombre_persona || ' ' || P.apellido_persona responsable,
	sum(AV.horas_avance) tiempo_empleado
	from actividades_inconveniente AI inner join actividad A on AI.id_actividad = A.id_actividad 
	inner join avance AV on A.id_actividad = AV.id_actividad 
	inner join persona p on P.id_persona = A.id_persona 
	group by actividad,responsable;
$$ language 'sql';
	
	
select * from consultaUno();
select * from consultaDos();
select * from consultaTres();
select * from consultaCuatro();
select * from consultaCinco();
select * from consultaSeis();
select * from consultaSiete();
select * from consultaOcho();
select * from consultaNueve();
select * from consultaDiez();

