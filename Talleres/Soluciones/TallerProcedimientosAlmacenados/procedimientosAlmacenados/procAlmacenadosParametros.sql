-- 2.
DROP PROCEDURE IF EXISTS consultaDos(INOUT REFCURSOR,in integer);
CREATE OR REPLACE PROCEDURE consultaDos(INOUT curs REFCURSOR,in in_actividad integer) AS $$
BEGIN
    OPEN curs FOR
        with filter_actividad as (
            select * from actividad A
            where A.id_actividad = in_actividad
        )
        select * from filter_actividad FA
        inner join persona P on P.id_persona = fa.id_actividad;
END
$$
    LANGUAGE 'plpgsql';

-- 5.
''''DROP PROCEDURE IF EXISTS consultaCinco(INOUT REFCURSOR, IN BOOLEAN);
CREATE OR REPLACE PROCEDURE consultaCinco(INOUT curs REFCURSOR, IN solo_repetidos BOOLEAN) AS $$
DECLARE temp_actividad TEXT;
BEGIN
    IF solo_repetidos THEN
        temp_actividad :=
                'select * from actividad A
                    where 1 < (select count(*)
                        from actividad A2 WHERE A2.id_persona = A.id_persona
                    )';
    ELSE
        temp_actividad :=
                'SELECT * FROM actividad';
    END IF;

    OPEN curs FOR EXECUTE
            'WITH actividades_inconveniente(id_actividad, id_inconveniente) AS (
        SELECT
            I.id_actividad,
            I.id_inconveniente
        FROM inconveniente I
                 INNER JOIN tipoinconveniente T ON I.id_tipoinconveniente = T.id_tipoinconveniente
        WHERE T.nombre_tipoinconveniente LIKE ''Fuerte''
    ),
        actividad_filtro as ('|| temp_actividad ||')
    SELECT DISTINCT
        A.nombre_actividad actividad,
        P.nombre_persona || '' '' || P.apellido_persona responsable
    FROM actividades_inconveniente AI
             INNER JOIN actividad_filtro A ON AI.id_actividad = A.id_actividad
             INNER JOIN persona P ON A.id_persona = P.id_persona
    order by responsable;';
END
$$
    LANGUAGE 'plpgsql';''''




-- 8.
DROP PROCEDURE IF EXISTS consultaOcho(INOUT REFCURSOR,in integer);
CREATE OR REPLACE PROCEDURE consultaOcho(INOUT curs REFCURSOR, in numInName integer ) AS $$
declare temp text;
    BEGIN
    temp := cast(numInName as text);
    OPEN curs FOR EXECUTE
        'WITH actividades_inconveniente(id_actividad, id_inconveniente) AS (
            SELECT
                I.id_actividad,
                I.id_inconveniente
            FROM inconveniente I
                     INNER JOIN tipoinconveniente T ON I.id_tipoinconveniente = T.id_tipoinconveniente
            WHERE T.nombre_tipoinconveniente LIKE ''Medio''
        ),persona_filter as (
            select * from persona
                     where nombre_persona like ''%'|| temp ||'%''
        )
        SELECT
            P.nombre_persona ||'' ''|| P.apellido_persona responsable,
            A.nombre_actividad actividad
        FROM actividades_inconveniente AI
                 INNER JOIN actividad A ON AI.id_actividad = A.id_actividad
                 INNER JOIN persona_filter P ON P.id_persona = A.id_persona;';
END
$$
    LANGUAGE 'plpgsql';