delete from inconveniente ;
delete from progreso ;
delete from actividad ;
delete from responsable ;

--1. Consulta para obtener un listado de actividades con
--el tiempo planeado para la ejecucion

select A.nombre_actividad actividad,
A.horas_planeadas tiempo_planeado
from actividad A;

--2. Consulta para obtener un listado de los responsables
--con las actividades asignadas
select R.nombre_responsable ||' '|| R.apellido_responsable responsable,
A.nombre_actividad actividad
from responsable R inner join actividad A on R.id_responsable = A.id_responsable ;



--3. Consulta para obtener un listado de las actividades que 
--presentaron inconvenientes de tipo bajo


select distinct(A.nombre_actividad) actividad
from actividad A inner join progreso P on A.id_actividad  = P.id_actividad 
inner join inconveniente I on I.id_progreso = P.id_progreso and I.id_actividad = P.id_actividad 
inner join tipo_inconveniente IT on IT.id_tipoinconveniente = I.id_tipoinconveniente
where IT.tipo_impacto like 'bajo';

--4. Consulta para obtener un listado de las actividades que presentaron
--inconvenientes de tipo medio con el tiempo planeado para la ejecución de las actividades

select distinct (A.nombre_actividad) actividad,
A.horas_planeadas tiempo_planeado
from actividad A inner join progreso P on A.id_actividad  = P.id_actividad 
inner join inconveniente I on I.id_progreso = P.id_progreso and I.id_actividad = P.id_actividad 
inner join tipo_inconveniente IT on IT.id_tipoinconveniente = I.id_tipoinconveniente
where IT.tipo_impacto like 'medio';


--5. Consulta para obtener un listado de las actividades que presentaron
--inconvenientes de tipo fuerte con los responsables de cada actividad

select distinct (A.nombre_actividad) actividad,
R.nombre_responsable || ' ' || R.apellido_responsable responsable 
from responsable R inner join actividad A on R.id_responsable = A.id_responsable 
inner join progreso P on A.id_actividad  = P.id_actividad 
inner join inconveniente I on I.id_progreso = P.id_progreso and I.id_actividad = P.id_actividad 
inner join tipo_inconveniente IT on IT.id_tipoinconveniente = I.id_tipoinconveniente
where IT.tipo_impacto like 'fuerte';

--6. Consulta para obtener un listado de las actividades que presentaron inconvenientes de cualquier
-- tipo con el calculo del total de tiempo empleado para la actividad

select A.nombre_actividad actividad, sum (P.tiempo_ejecutado) tiempo_empleado
from actividad A inner join progreso P on A.id_actividad = P.id_actividad 
inner join inconveniente I on P.id_progreso = I.id_progreso and I.id_actividad = A.id_actividad 
group by actividad;

--7. Consulta para obtener un listado de las actividades que presentaron inconvenientes de tipo bajo
-- con los responsables y con el calculo del total de tiempo empleado para las actividades

with actividades_inconveniente (id_actividad) as 
(
	select distinct I.id_actividad 
	from inconveniente I inner join tipo_inconveniente TI on I.id_tipoinconveniente = TI.id_tipoinconveniente 
	where TI.tipo_impacto like 'bajo'
)
select A.nombre_actividad actividad,
R.nombre_responsable || ' ' || R.apellido_responsable responsable,
sum(P.tiempo_ejecutado) tiempo_empleado
from actividades_inconveniente AI inner join actividad A on AI.id_actividad = A.id_actividad 
inner join progreso P on A.id_actividad = P.id_actividad 
inner join responsable R on R.id_responsable = A.id_responsable 
group by actividad,responsable;


	
--8. Consulta para obtener un listado de los responsables con las actividades asignadas
-- que presentaron inconvenientes de tipo medio


select R.nombre_responsable ||' '|| R.apellido_responsable responsable,
A.nombre_actividad actividad
from responsable R inner join actividad A on R.id_responsable = A.id_responsable 
inner join progreso P on P.id_actividad = A.id_actividad 
inner join inconveniente I on I.id_actividad = A.id_actividad and I.id_progreso = P.id_progreso 
inner join tipo_inconveniente TI on TI.id_tipoinconveniente = I.id_tipoinconveniente 
where TI.tipo_impacto like 'medio';



--9 Consulta para obtener in listado de responsables con las actividades asignadas que presentaron
-- inconvenientes de tipo fuerte y con el tiempo planeado para la ejecucion de las actividades

with actividades_inconveniente (id_actividad) as 
(
	select distinct I.id_actividad 
	from inconveniente I inner join tipo_inconveniente TI on I.id_tipoinconveniente = TI.id_tipoinconveniente 
	where TI.tipo_impacto like 'fuerte'
)
select distinct(R.nombre_responsable || ' ' || R.apellido_responsable)responsable,
A.nombre_actividad actividad,
A.horas_planeadas tiempo_planeado
from actividades_inconveniente AI inner join actividad A on AI.id_actividad = A.id_actividad 
inner join progreso P on A.id_actividad = P.id_actividad 
inner join responsable R on R.id_responsable = A.id_responsable ;



--10. Consulta para obtener un listado de los responsables con las actividades asignadas que
-- presentaron inconvenientes de tipo bajo o fuerte, con el calculo total de tiempo empleado para las actividades

with actividades_inconveniente (id_actividad) as 
(
	select distinct I.id_actividad 
	from inconveniente I inner join tipo_inconveniente TI on I.id_tipoinconveniente = TI.id_tipoinconveniente 
	where TI.tipo_impacto in ('bajo','fuerte')
)
select A.nombre_actividad actividad,
R.nombre_responsable || ' ' || R.apellido_responsable responsable,
sum(P.tiempo_ejecutado) tiempo_empleado
from actividades_inconveniente AI inner join actividad A on AI.id_actividad = A.id_actividad 
inner join progreso P on A.id_actividad = P.id_actividad 
inner join responsable R on R.id_responsable = A.id_responsable 
group by actividad,responsable;












