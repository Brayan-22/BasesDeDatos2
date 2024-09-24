--1. Consulta para obtener un listado de actividades con
--el tiempo planeado para la ejecucion

-- Procedimiento almacenado
DROP PROCEDURE IF EXISTS consultaUno(refcursor);

CREATE OR REPLACE PROCEDURE consultaUno(
	my_cursor inout refcursor
)
LANGUAGE plpgsql
AS $$
BEGIN
	
    OPEN my_cursor FOR 
		select A.nombre_actividad actividad,
		A.horas_plan_actividad tiempo_planeado
		from actividad A;
END;
$$;

--2. Consulta para obtener un listado de los responsables
--con las actividades asignadas

-- Procedimiento almacenado
DROP PROCEDURE IF EXISTS consultaDos(refcursor);

CREATE OR REPLACE PROCEDURE consultaDos(
	my_cursor inout refcursor
)
LANGUAGE plpgsql
AS $$
BEGIN
	
    OPEN my_cursor FOR 
		select P.nombre_persona ||' '|| P.apellido_persona responsable,
		A.nombre_actividad actividad
		from persona P inner join actividad A on P.id_persona = A.id_persona ;
END;
$$;

--3. Consulta para obtener un listado de las actividades que 
--presentaron inconvenientes de tipo bajo

-- Procedimiento almacenado
DROP PROCEDURE IF EXISTS consultaTres(refcursor);

CREATE OR REPLACE PROCEDURE consultaTres(
	my_cursor inout refcursor
)
LANGUAGE plpgsql
AS $$
BEGIN
	
    OPEN my_cursor FOR 
		with actividades_inconveniente(id_actividad,id_inconveniente) as 
		(
			select I.id_actividad,I.id_inconveniente
			from inconveniente I inner join tipoinconveniente T on I.id_tipoinconveniente = T.id_tipoinconveniente 
			where T.nombre_tipoinconveniente like 'bajo'
		)
		select distinct A.nombre_actividad as actividad
		from actividades_inconveniente AI 
		inner join actividad A on AI.id_actividad = A.id_actividad ;
END;
$$;


--4. Consulta para obtener un listado de las actividades que presentaron
--inconvenientes de tipo medio con el tiempo planeado para la ejecución de las actividades

--Procedimiento almacenado
DROP PROCEDURE IF EXISTS consultaCuatro(refcursor);

CREATE OR REPLACE PROCEDURE consultaCuatro(
	my_cursor inout refcursor
)
LANGUAGE plpgsql
AS $$
BEGIN
	
    OPEN my_cursor FOR 
		with actividades_inconveniente(id_actividad,id_inconveniente) as 
		(
			select I.id_actividad,I.id_inconveniente
			from inconveniente I inner join tipoinconveniente T on I.id_tipoinconveniente = T.id_tipoinconveniente 
			where T.nombre_tipoinconveniente like 'bajo'
		)
		select distinct A.nombre_actividad as actividad
		from actividades_inconveniente AI 
		inner join actividad A on AI.id_actividad = A.id_actividad ;
END;
$$;



--5. Consulta para obtener un listado de las actividades que presentaron
--inconvenientes de tipo fuerte con los responsables de cada actividad

DROP PROCEDURE IF EXISTS consultaCinco(refcursor);

CREATE OR REPLACE PROCEDURE consultaCinco(
	my_cursor inout refcursor
)
LANGUAGE plpgsql
AS $$
BEGIN
	
    OPEN my_cursor FOR 
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
END;
$$;


--6. Consulta para obtener un listado de las actividades que presentaron inconvenientes de cualquier
-- tipo con el calculo del total de tiempo empleado para la actividad

--Procedimiento almacenado

DROP PROCEDURE IF EXISTS consultaSeis(refcursor);

CREATE OR REPLACE PROCEDURE consultaSeis(
	my_cursor inout refcursor
)
LANGUAGE plpgsql
AS $$
BEGIN
	
    OPEN my_cursor FOR 
		select A.nombre_actividad actividad, sum (AV.horas_avance) tiempo_empleado
		from actividad A 
		inner join avance AV on A.id_actividad = AV.id_actividad 
		inner join inconveniente I on AV.id_avance = I.id_avance and I.id_actividad = A.id_actividad 
		group by actividad;
END;
$$;

--7. Consulta para obtener un listado de las actividades que presentaron inconvenientes de tipo bajo
-- con los responsables y con el calculo del total de tiempo empleado para las actividades

--Procedimiento almacenado:

DROP PROCEDURE IF EXISTS consultaSiete(refcursor);

CREATE OR REPLACE PROCEDURE consultaSiete(
	my_cursor inout refcursor
)
LANGUAGE plpgsql
AS $$
BEGIN
	
    OPEN my_cursor FOR 
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
END;
$$;

--8. Consulta para obtener un listado de los responsables con las actividades asignadas
-- que presentaron inconvenientes de tipo medio

--Procedimiento almacenado

DROP PROCEDURE IF EXISTS consultaOcho(refcursor);

CREATE OR REPLACE PROCEDURE consultaOcho(
	my_cursor inout refcursor
)
LANGUAGE plpgsql
AS $$
BEGIN
	
    OPEN my_cursor FOR 
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
END;
$$;

----9 Consulta para obtener in listado de responsables con las actividades asignadas que presentaron
-- inconvenientes de tipo fuerte y con el tiempo planeado para la ejecucion de las actividades

-- Procedimiento almacenado

DROP PROCEDURE IF EXISTS consultaNueve(refcursor);

CREATE OR REPLACE PROCEDURE consultaNueve(
	my_cursor inout refcursor
)
LANGUAGE plpgsql
AS $$
BEGIN
	
    OPEN my_cursor FOR 
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
END;
$$;

--10. Consulta para obtener un listado de los responsables con las actividades asignadas que
-- presentaron inconvenientes de tipo bajo o fuerte, con el calculo total de tiempo empleado para las actividades

--Procedimiento almacenado



DROP PROCEDURE IF EXISTS consultaDiez(refcursor);

CREATE OR REPLACE PROCEDURE consultaDiez(
	my_cursor inout refcursor
)
LANGUAGE plpgsql
AS $$
BEGIN
	
    OPEN my_cursor FOR 
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
END;
$$;








BEGIN;
CALL consultaDiez('my_cursor');
FETCH ALL IN my_cursor;
CLOSE my_cursor;
COMMIT;




