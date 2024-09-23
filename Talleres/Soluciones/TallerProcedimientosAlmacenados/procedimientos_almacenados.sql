--1. Consulta para obtener un listado de actividades con
--el tiempo planeado para la ejecucion

-- Procedimiento almacenado
drop procedure if exists consultaUno();
create or replace procedure consultaUno()
as $$
	create materialized view if not exists consultaUno as
		select A.nombre_actividad actividad,
		A.horas_plan_actividad tiempo_planeado
		from actividad A;
	refresh materialized view consultaUno;
$$ language 'sql';



--2. Consulta para obtener un listado de los responsables
--con las actividades asignadas

-- Procedimiento almacenado
drop procedure if exists consultaDos();
create or replace procedure consultaDos()
as $$
	create materialized view if not exists consultaDos as
		select P.nombre_persona ||' '|| P.apellido_persona responsable,
		A.nombre_actividad actividad
		from persona P inner join actividad A on P.id_persona = A.id_persona ;
	refresh materialized view consultaDos;
$$ language 'sql';


--3. Consulta para obtener un listado de las actividades que 
--presentaron inconvenientes de tipo bajo

-- Procedimiento almacenado

drop procedure if exists consultaTres();
create or replace procedure consultaTres()
as $$
	create materialized view if not exists consultaTres as
		with actividades_inconveniente(id_actividad,id_inconveniente) as 
		(
			select I.id_actividad,I.id_inconveniente
			from inconveniente I inner join tipoinconveniente T on I.id_tipoinconveniente = T.id_tipoinconveniente 
			where T.nombre_tipoinconveniente like 'bajo'
		)
		select distinct A.nombre_actividad as actividad
		from actividades_inconveniente AI 
		inner join actividad A on AI.id_actividad = A.id_actividad ;
	refresh materialized view consultaTres;
$$ language 'sql';


--4. Consulta para obtener un listado de las actividades que presentaron
--inconvenientes de tipo medio con el tiempo planeado para la ejecución de las actividades

--Procedimiento almacenado
drop procedure if exists consultaCuatro();
create or replace procedure consultaCuatro()
as $$
	create materialized view if not exists consultaCuatro as
		with actividades_inconveniente(id_actividad,id_inconveniente) as 
		(
			select I.id_actividad,I.id_inconveniente
			from inconveniente I inner join tipoinconveniente T on I.id_tipoinconveniente = T.id_tipoinconveniente 
			where T.nombre_tipoinconveniente like 'medio'
		)
		select distinct A.nombre_actividad actividad, A.horas_plan_actividad tiempo_planeado
		from actividades_inconveniente AI 
		inner join actividad A on AI.id_actividad = A.id_actividad ;
	refresh materialized view consultaCuatro;
$$ language 'sql';


--5. Consulta para obtener un listado de las actividades que presentaron
--inconvenientes de tipo fuerte con los responsables de cada actividad

drop procedure if exists consultaCinco();
create or replace procedure consultaCinco()
as $$
	create materialized view if not exists consultaCinco as
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
	refresh materialized view consultaCinco;
$$ language 'sql';

--6. Consulta para obtener un listado de las actividades que presentaron inconvenientes de cualquier
-- tipo con el calculo del total de tiempo empleado para la actividad

--Procedimiento almacenado
drop procedure if exists consultaSeis();
create or replace procedure consultaSeis()
as $$
	create materialized view if not exists consultaSeis as
		select A.nombre_actividad actividad, sum (AV.horas_avance) tiempo_empleado
		from actividad A 
		inner join avance AV on A.id_actividad = AV.id_actividad 
		inner join inconveniente I on AV.id_avance = I.id_avance and I.id_actividad = A.id_actividad 
		group by actividad;
	refresh materialized view consultaSeis;
$$ language 'sql';



--7. Consulta para obtener un listado de las actividades que presentaron inconvenientes de tipo bajo
-- con los responsables y con el calculo del total de tiempo empleado para las actividades

--Procedimiento almacenado:
drop procedure if exists consultaSiete();
create or replace procedure consultaSiete()
as $$
	create materialized view if not exists consultaSiete as
		select A.nombre_actividad actividad, sum (AV.horas_avance) tiempo_empleado
		from actividad A 
		inner join avance AV on A.id_actividad = AV.id_actividad 
		inner join inconveniente I on AV.id_avance = I.id_avance and I.id_actividad = A.id_actividad 
		group by actividad;
	refresh materialized view consultaSiete;
$$ language 'sql';



--8. Consulta para obtener un listado de los responsables con las actividades asignadas
-- que presentaron inconvenientes de tipo medio

--Procedimiento almacenado

drop procedure if exists consultaOcho();
create or replace procedure consultaOcho()
as $$
	create materialized view if not exists consultaOcho as
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
	refresh materialized view consultaOcho;
$$ language 'sql';

----9 Consulta para obtener in listado de responsables con las actividades asignadas que presentaron
-- inconvenientes de tipo fuerte y con el tiempo planeado para la ejecucion de las actividades

-- Procedimiento almacenado

drop procedure if exists consultaNueve();
create or replace procedure consultaNueve()
as $$
	create materialized view if not exists consultaNueve as
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
	refresh materialized view consultaNueve;
$$ language 'sql';



--10. Consulta para obtener un listado de los responsables con las actividades asignadas que
-- presentaron inconvenientes de tipo bajo o fuerte, con el calculo total de tiempo empleado para las actividades

--Procedimiento almacenado
drop procedure if exists consultaDiez();
create or replace procedure consultaDiez()
as $$
	create materialized view if not exists consultaDiez as
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
	refresh materialized view consultaDiez;
$$ language 'sql';






