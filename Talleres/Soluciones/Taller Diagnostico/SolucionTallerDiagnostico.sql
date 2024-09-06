--1. Listar todos los individuos con la informacion de:
-- - Identificacion del individuo
-- - Nombre y apellido del usuario que lo registro
-- - Estado del individuo
-- - Nombre del paramo en el que esta ubicado
-- - Nombre del municipio en el que esta ubicado
-- - Nombre del departamento en el que esta ubicado

select I.ind_id individuo,U.usu_nombre||' '||U.usu_apellido usuario,
EI.esi_nombre estado,P.par_nombre paramo ,M.mun_nombre municipio,D.dep_nombre departamento
from individuo I, estado_individuo EI, usuario U,paramo P,municipio M, departamento D,municipio_paramo MXP
where I.esi_id = EI.esi_id 
and I.usu_id = U.usu_id 
and I.mxp_id = MXP.mxp_id 
and MXP.mun_id = M.mun_id 
and MXP.par_id = p.par_id 
and M.dep_id = D.dep_id ;

-- 2.  Contar por estado del individuo cuantos tienen cada estado y presentar:
-- - identificador del estado
-- - nombre del estado
-- - cantidad de individuos

select EI.esi_id id_estado,EI.esi_nombre estado,count(EI.esi_id) cantidad_Individuos
from individuo I, estado_individuo EI
where I.esi_id = EI.esi_id
group by EI.esi_id,EI.esi_nombre
order by EI.esi_id ;

-- 3.  Contar por departamento cuántos individuos hay y presentar:
-- - código del departamento
-- - nombre del departamento
-- - cantidad de individuos

select D.dep_codigo codigo_departamento,D.dep_nombre nombre_departamento,count(D.dep_id) cantidad_Individuos
from individuo I,municipio_paramo MXP,municipio M,departamento D
where I.mxp_id = MXP.mxp_id 
and MXP.mun_id = M.mun_id 
and M.dep_id = D.dep_id 
group by D.dep_id
order by D.dep_codigo ;

-- 4. Contar por municipio cuántos individuos hay y presentar:
-- - código del municipio
-- - nombre del municipio
-- - cantidad de individuos
select M.mun_codigo codigo_municipio,M.mun_nombre nombre_municipio,count(M.mun_id) cantidad_Individuos
from individuo I,municipio_paramo MXP,municipio M
where I.mxp_id = MXP.mxp_id 
and MXP.mun_id = M.mun_id 
group by M.mun_id 
order by M.mun_codigo  ;


-- 5.  Contar por páramo cuántos individuos hay y presentar:
-- - nombre del páramo
-- - cantidad de individuos
select P.par_id codigo_paramo,P.par_nombre nombre_paramo,count(P.par_id) cantidad_Individuos
from individuo I,municipio_paramo MXP,paramo P
where I.mxp_id = MXP.mxp_id 
and MXP.par_id  = P.par_id 
group by P.par_id 
order by P.par_id; 


-- 6. Listar por departamento cuántos municipios tienen individuos muertos y presentar:
-- - código del departamento.
-- - cantidad de municipios con individuos muertos
-- - cantidad de individuos muertos.

select d.dep_codigo departamento, count(distinct M.mun_id) as mun_con_ind_muertos, count(I.ind_id) as ind_muertos 
from departamento D,municipio M,municipio_paramo MXP,individuo I,estado_individuo EI
where I.esi_id = EI.esi_id 
and I.mxp_id = MXP.mxp_id 
and MXP.mun_id = M.mun_id 
and M.dep_id = D.dep_id 
and lower(EI.esi_nombre) like 'muerto'
group by d.dep_id ,d.dep_codigo 
order by d.dep_codigo ;


-- 7. Listar por año cuántos individuos fueron inventariados.

select extract(year from I.ind_fecha)as "Año",
	count(I.ind_id) as cantidad_ind
from individuo I
group by extract(year from I.ind_fecha)
order by "Año";



--8. Listar por año y por usuario cuántos individuos se inventariaron.
select extract(year from I.ind_fecha)as anio,U.usu_nombre usuario,
	count(I.ind_id) as cantidad_ind
from individuo I,usuario U
where I.usu_id = U.usu_id
group by extract(year from I.ind_fecha),U.usu_id,U.usu_nombre 
order by anio,usuario;


-- 9. Listar por año el departamento que más individuos inventario.


with ind_por_anio as (
	select d.dep_nombre as departamento ,extract(year from I.ind_fecha)as anio,D.dep_id as dep_id,count(I.ind_id) as ind
	from individuo I join municipio_paramo MXP on I.mxp_id = MXP.mxp_id 
	join municipio M on MXP.mun_id = M.mun_id 
	join departamento D on M.dep_id = D.dep_id 
	group by d.dep_nombre ,d.dep_id ,extract(year from I.ind_fecha)
)
select anio,departamento
from ind_por_anio
where (anio,ind) in (select ind_por_anio_dep.anio,max(ind_por_anio_dep.ind) max_ind
from (select extract(year from I.ind_fecha)as anio,D.dep_id,count(I.ind_id) as ind
from individuo I join municipio_paramo MXP on I.mxp_id = MXP.mxp_id 
join municipio M on MXP.mun_id = M.mun_id 
join departamento D on M.dep_id = D.dep_id 
group by d.dep_id ,extract(year from I.ind_fecha)) as ind_por_anio_dep
group by ind_por_anio_dep.anio)
order by anio;


-- 10.Listar por usuario el año en que más individuos inventario.

with ind_por_usu as (
	select extract(year from I.ind_fecha)as anio,count(I.ind_id) individuos,U.usu_id as u_id,U.usu_nombre as nombre
	from individuo I,usuario U
	where I.usu_id = U.usu_id 
	group by extract(year from I.ind_fecha),U.usu_id
)
select nombre,anio
from ind_por_usu
where (individuos,u_id) in (select max(ind_por_usu.individuos) as individuos,ind_por_usu.usu_id as usu
		from (select extract(year from I.ind_fecha)as anio,count(I.ind_id) individuos,U.usu_id 
		from individuo I,usuario U
		where I.usu_id = U.usu_id 
		group by extract(year from I.ind_fecha),U.usu_id
		)as ind_por_usu
		group by ind_por_usu.usu_id
		order by ind_por_usu.usu_id)
order by nombre;
