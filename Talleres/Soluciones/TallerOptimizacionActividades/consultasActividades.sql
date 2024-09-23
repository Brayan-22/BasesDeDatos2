--1. Consulta para obtener un listado de actividades con
--el tiempo planeado para la ejecucion
--Consulta sin optimizar
select A.nombre_actividad actividad,
A.horas_plan_actividad tiempo_planeado
from actividad A;
-- Consulta optimizada 
-- No se puede optimizar mas

-- Consulta con tiempo de ejecucion 
explain analyze 
select A.nombre_actividad actividad,
A.horas_plan_actividad tiempo_planeado
from actividad A;

--2. Consulta para obtener un listado de los responsables
--con las actividades asignadas
select P.nombre_persona ||' '|| P.apellido_persona responsable,
A.nombre_actividad actividad
from persona P inner join actividad A on P.id_persona = A.id_persona ;
--Consulta con tiempo de ejecucion

explain analyze
select P.nombre_persona ||' '|| P.apellido_persona responsable,
A.nombre_actividad actividad
from persona P inner join actividad A on P.id_persona = A.id_persona ;

-- Creacion de una vista materializada para las consultas que tienen en comun inconveniente_tipo_inconveniente


CREATE MATERIALIZED view if not exists mv_inconveniente_tipoinconveniente AS
select I.id_actividad,I.id_inconveniente,T.nombre_tipoinconveniente
from inconveniente I inner join tipoinconveniente T on I.id_tipoinconveniente = T.id_tipoinconveniente;


--

--3. Consulta para obtener un listado de las actividades que 
--presentaron inconvenientes de tipo bajo
-- Consulta sin optimizar:
explain analyze
select distinct A.nombre_actividad as actividad
from actividad A
inner join avance AV on A.id_actividad = AV.id_actividad 
inner join inconveniente I on I.id_avance = AV.id_avance and I.id_actividad = AV.id_actividad 
inner join tipoinconveniente TI on TI.id_tipoinconveniente = I.id_tipoinconveniente 
where TI.nombre_tipoinconveniente like 'bajo';

--Consulta optimizada:
explain analyze
with actividades_inconveniente(id_actividad,id_inconveniente) as 
(
	select I.id_actividad,I.id_inconveniente
	from inconveniente I inner join tipoinconveniente T on I.id_tipoinconveniente = T.id_tipoinconveniente 
	where T.nombre_tipoinconveniente like 'bajo'
)
select distinct A.nombre_actividad as actividad
from actividades_inconveniente AI 
inner join actividad A on AI.id_actividad = A.id_actividad ;

--Consulta aún mas optimizada: 
explain analyze
select distinct A.nombre_actividad as actividad
from mv_inconveniente_tipoinconveniente mit inner join actividad A on A.id_actividad = mit.id_actividad 
where mit.nombre_tipoinconveniente like 'bajo'


--Consulta sin optimizar:
explain analyze
select distinct A.id_actividad idActividad,A.nombre_actividad actividad
from actividad A 
inner join avance AV on A.id_actividad = AV.id_actividad 
inner join inconveniente I on I.id_avance = AV.id_avance and I.id_actividad = AV.id_actividad 
inner join tipoinconveniente TI on TI.id_tipoinconveniente = I.id_tipoinconveniente 
where TI.nombre_tipoinconveniente like 'bajo';

--Consulta optimizada:
explain analyze
with actividades_inconveniente(id_actividad,id_inconveniente) as 
(
	select I.id_actividad,I.id_inconveniente
	from inconveniente I inner join tipoinconveniente T on I.id_tipoinconveniente = T.id_tipoinconveniente 
	where T.nombre_tipoinconveniente like 'bajo'
)
select distinct A.id_actividad idActividad,A.nombre_actividad as actividad
from actividades_inconveniente AI 
inner join actividad A on AI.id_actividad = A.id_actividad ;

--Consulta aún mas optimizada: 
explain analyze
select distinct A.id_actividad idActividad,A.nombre_actividad as actividad
from mv_inconveniente_tipoinconveniente mit inner join actividad A on A.id_actividad = mit.id_actividad 
where mit.nombre_tipoinconveniente like 'bajo'



--4. Consulta para obtener un listado de las actividades que presentaron
--inconvenientes de tipo medio con el tiempo planeado para la ejecución de las actividades
--Consulta sin optimizar:
explain analyze
select distinct (A.nombre_actividad) actividad,
A.horas_plan_actividad tiempo_planeado
from actividad A inner join avance AV on A.id_actividad  = AV.id_actividad 
inner join inconveniente I on I.id_avance = AV.id_avance and I.id_actividad = AV.id_actividad 
inner join tipoinconveniente IT on IT.id_tipoinconveniente = I.id_tipoinconveniente
where IT.nombre_tipoinconveniente like 'medio';

--Consulta optimizada
explain analyze
with actividades_inconveniente(id_actividad,id_inconveniente) as 
(
	select I.id_actividad,I.id_inconveniente
	from inconveniente I inner join tipoinconveniente T on I.id_tipoinconveniente = T.id_tipoinconveniente 
	where T.nombre_tipoinconveniente like 'medio'
)
select distinct A.nombre_actividad actividad, A.horas_plan_actividad tiempo_planeado
from actividades_inconveniente AI 
inner join actividad A on AI.id_actividad = A.id_actividad ;

--Consulta aún mas optimizada

explain analyze
select distinct A.nombre_actividad as actividad,A.horas_plan_actividad tiempo_planeado
from mv_inconveniente_tipoinconveniente mit inner join actividad A on A.id_actividad = mit.id_actividad 
where mit.nombre_tipoinconveniente like 'medio';



--5. Consulta para obtener un listado de las actividades que presentaron
--inconvenientes de tipo fuerte con los responsables de cada actividad


--Consulta sin optimizar
explain analyze
select distinct (A.nombre_actividad) actividad,
P.nombre_persona || ' ' || P.apellido_persona responsable 
from persona P inner join actividad A on P.id_persona = A.id_persona 
inner join avance AV on A.id_actividad  = AV.id_actividad 
inner join inconveniente I on I.id_avance = AV.id_avance and I.id_actividad = AV.id_actividad 
inner join tipoinconveniente IT on IT.id_tipoinconveniente = I.id_tipoinconveniente
where IT.nombre_tipoinconveniente like 'fuerte';

--Consulta optimizada
explain analyze
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

--Consulta aún mas optimizada: 
explain analyze
select distinct A.nombre_actividad as actividad,P.nombre_persona || ' ' || P.apellido_persona responsable 
from mv_inconveniente_tipoinconveniente mit inner join actividad A on A.id_actividad = mit.id_actividad 
inner join persona P on P.id_persona = A.id_persona
where mit.nombre_tipoinconveniente like 'fuerte'


---Vista materializada de uso comun de : actividad_avance_inconveniente


CREATE MATERIALIZED view if not exists mv_actividad_avance_inconveniente AS
select A.id_actividad,A.nombre_actividad actividad, AV.horas_avance
from actividad A 
inner join avance AV on A.id_actividad = AV.id_actividad 
inner join inconveniente I on AV.id_avance = I.id_avance and I.id_actividad = A.id_actividad ;


--6. Consulta para obtener un listado de las actividades que presentaron inconvenientes de cualquier
-- tipo con el calculo del total de tiempo empleado para la actividad
--Consulta sin optimizar
explain analyze
select A.nombre_actividad actividad, sum (AV.horas_avance) tiempo_empleado
from actividad A 
inner join avance AV on A.id_actividad = AV.id_actividad 
inner join inconveniente I on AV.id_avance = I.id_avance and I.id_actividad = A.id_actividad 
group by actividad;

--Consulta optimizada:
explain analyze
SELECT vm.actividad, SUM(horas_avance) AS tiempo_empleado
FROM mv_actividad_avance_inconveniente vm
GROUP BY vm.actividad ;


--7. Consulta para obtener un listado de las actividades que presentaron inconvenientes de tipo bajo
-- con los responsables y con el calculo del total de tiempo empleado para las actividades


--Consulta sin optimizar
explain analyze
select A.nombre_actividad actividad,
P.nombre_persona || ' ' || P.apellido_persona responsable,
sum(AV.horas_avance) tiempo_empleado
from actividad A inner join inconveniente I on I.id_actividad = A.id_actividad 
inner join tipoinconveniente TI on TI.id_tipoinconveniente = I.id_tipoinconveniente 
inner join avance AV on A.id_actividad = AV.id_actividad 
inner join persona P on P.id_persona = A.id_persona 
where (A.id_actividad) in (
	select distinct I.id_actividad 
	from inconveniente I inner join tipoinconveniente TI on I.id_tipoinconveniente = TI.id_tipoinconveniente 
	where TI.nombre_tipoinconveniente like 'bajo'
)
group by actividad,responsable

--Consulta optimizada:
explain analyze
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
group by actividad,responsable

--consulta aún más optimizada
explain analyze
select A.nombre_actividad actividad,
P.nombre_persona || ' ' || P.apellido_persona responsable,
sum(maai.horas_avance) tiempo_empleado 
from mv_actividad_avance_inconveniente maai 
inner join actividad A on maai.id_actividad = A.id_actividad 
inner join persona P on P.id_persona = A.id_persona 
inner join mv_inconveniente_tipoinconveniente mit on mit.id_actividad = A.id_actividad 
where mit.nombre_tipoinconveniente like 'bajo'
group by A.nombre_actividad , responsable


--8. Consulta para obtener un listado de los responsables con las actividades asignadas
-- que presentaron inconvenientes de tipo medio

--Consulta sin optimizar
explain analyze
select P.nombre_persona ||' '|| P.apellido_persona responsable,
A.nombre_actividad actividad
from persona P inner join actividad A on P.id_persona = A.id_persona 
inner join avance AV on AV.id_actividad = A.id_actividad 
inner join inconveniente I on I.id_actividad = A.id_actividad and I.id_avance = AV.id_avance 
inner join tipoinconveniente TI on TI.id_tipoinconveniente = I.id_tipoinconveniente 
where TI.nombre_tipoinconveniente like 'medio';

--Consulta optimizada:
explain analyze
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
inner join persona P on P.id_persona = A.id_persona

--Consulta aún mas optimizada
explain analyze
select P.nombre_persona ||' '|| P.apellido_persona responsable,
A.nombre_actividad as actividad
from mv_inconveniente_tipoinconveniente mit 
inner join actividad A on A.id_actividad = mit.id_actividad 
inner join persona P on A.id_persona = P.id_persona
where mit.nombre_tipoinconveniente like 'medio'



--9 Consulta para obtener in listado de responsables con las actividades asignadas que presentaron
-- inconvenientes de tipo fuerte y con el tiempo planeado para la ejecucion de las actividades

--Consulta sin optimizar
explain analyze
select distinct(P.nombre_persona || ' ' || P.apellido_persona)responsable,
A.nombre_actividad actividad,
A.horas_plan_actividad tiempo_planeado
from actividad A  
inner join avance AV on A.id_actividad = AV.id_actividad 
inner join persona P on P.id_persona = A.id_persona 
where (A.id_actividad) in (
	select distinct I.id_actividad 
	from inconveniente I inner join tipoinconveniente TI on I.id_tipoinconveniente = TI.id_tipoinconveniente 
	where TI.nombre_tipoinconveniente like 'fuerte'
);


--Consulta optimizada
explain analyze
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

--Consulta aún mas optimizada:

explain analyze
select distinct(P.nombre_persona || ' ' || P.apellido_persona)responsable,
A.nombre_actividad actividad,
A.horas_plan_actividad tiempo_planeado
from mv_inconveniente_tipoinconveniente MIT inner join actividad A on MIT.id_actividad = A.id_actividad 
inner join persona P on P.id_persona = A.id_persona 
where MIT.nombre_tipoinconveniente like 'fuerte';


--10. Consulta para obtener un listado de los responsables con las actividades asignadas que
-- presentaron inconvenientes de tipo bajo o fuerte, con el calculo total de tiempo empleado para las actividades


--Consulta sin optimizar
explain analyze
select A.nombre_actividad actividad,
P.nombre_persona || ' ' || P.apellido_persona responsable,
sum(AV.horas_avance) tiempo_empleado
from actividad A 
inner join avance AV on A.id_actividad = AV.id_actividad 
inner join persona p on P.id_persona = A.id_persona 
where (A.id_actividad) in (
	select distinct I.id_actividad 
	from inconveniente I inner join tipoinconveniente TI on I.id_tipoinconveniente = TI.id_tipoinconveniente 
	where TI.nombre_tipoinconveniente in ('bajo','fuerte')
)
group by actividad,responsable;


--Consulta optimizada
explain analyze
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


--Consulta aún mas optimizada
explain analyze
select A.nombre_actividad actividad,
P.nombre_persona || ' ' || P.apellido_persona responsable,
sum(maai.horas_avance) tiempo_empleado
from actividad A
inner join mv_actividad_avance_inconveniente maai on A.id_actividad = maai.id_actividad 
inner join mv_inconveniente_tipoinconveniente mit on mit.id_actividad = A.id_actividad 
inner join persona p on P.id_persona = A.id_persona 
where mit.nombre_tipoinconveniente in ('bajo','fuerte')
group by A.nombre_actividad ,responsable;


