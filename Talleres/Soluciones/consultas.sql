
--1.
select ciu.nombre ciudad,p.nombre producto,vp.cantidad cantidad 
from cliente c,ciudad ciu,venta v,venta_producto vp,producto p
where c.idciudad = ciu.idciudad 
and v.idcliente = c.idcliente 
and v.idventa = vp.idventa 
and vp.idproducto = p.idproducto
and (ciu.idciudad,vp.cantidad) in (select ciu.idciudad ciudad ,min(vp.cantidad) 
from cliente c,ciudad ciu,venta v,venta_producto vp,producto p
where c.idciudad = ciu.idciudad 
and v.idcliente = c.idcliente 
and v.idventa = vp.idventa 
and vp.idproducto = p.idproducto
group by ciu.idciudad 
);
 

--2 
with product_por_mes as(
	select vp.idproducto producto,v.fechaventa fecha,sum(vp.cantidad) cantidad
	from venta v,venta_producto vp,producto p
	where v.idventa = vp.idventa 
	and p.idproducto = vp.idproducto
	group by vp.idproducto,v.fechaventa 
	order by v.fechaventa,vp.idproducto 
)
select to_char(product_por_mes.fecha,'YYYY-MM') mes,p.nombre producto,product_por_mes.cantidad cantidad_vendida
from product_por_mes,producto p
where p.idproducto = product_por_mes.producto
and (extract(month from product_por_mes.fecha),product_por_mes.cantidad) 
in 
(select extract(month from ps.fecha) mes,min(ps.cantidad) cantidad
from product_por_mes ps
group by extract(month from ps.fecha)
order by mes);

--3

with compra_cliente as (
	select c.idcliente cliente,sum(p.precio*vp.cantidad) total
	from cliente c, ciudad ci,venta v,venta_producto vp, producto p 
	where c.idciudad = ci.idciudad 
	and c.idcliente = v.idcliente 
	and v.idventa = vp.idventa 
	and vp.idproducto = p.idproducto
	group by c.idcliente 
)
select ciu.nombre ,c.nombre cliente,compra_cliente.total total_gastado
from compra_cliente,cliente c,ciudad ciu
where compra_cliente.cliente = c.idcliente
and ciu.idciudad = c.idciudad 
and(compra_cliente.cliente,compra_cliente.total) 
in
(compra_cliente);


--4

select sum((p.precio*(cat.impuesto/100))*vp.cantidad) total_impuestos
from venta v,venta_producto vp,producto p,categoria cat
where v.idventa = vp.idventa 
and p.idproducto = vp.idproducto 
and p.idcategoria = cat.idcategoria;

--5 


select p.nombre producto,p.precio precio
from producto p ;


--6

with cant_por_cat as (
	select p.idcategoria cat ,d.iddepartamento dep,sum(vp.cantidad) cantidad
	from departamento d,ciudad ci,cliente c,venta v,venta_producto vp,producto p ,categoria cat
	where d.iddepartamento = ci.iddepartamento 
	and ci.idciudad = c.idciudad 
	and c.idcliente = v.idcliente 
	and v.idventa = vp.idventa 
	and vp.idproducto = p.idproducto 
	and p.idcategoria = cat.idcategoria 
	group by p.idproducto,d.iddepartamento
	order by dep,p.idcategoria 
)
select dep.nombre departamento,cat.nombre categoria, cant_por_cat.cantidad
from cant_por_cat,categoria cat,departamento dep
where cant_por_cat.cat = cat.idcategoria 
and cant_por_cat.dep = dep.iddepartamento 
and (cant_por_cat.dep,cant_por_cat.cantidad) in (
select cant_por_cat.dep,max(cant_por_cat.cantidad) 
from cant_por_cat
group by cant_por_cat.dep
);


--7


select p.nombre producto,p.precio precio_actual,((p.precio*(2.3/100))+p.precio) proyeccion_precios
from producto p,categoria c 
where p.idcategoria = c.idcategoria ;


--8

select c.nombre cliente,sum(p.precio*vp.cantidad) total_gastado 
	from cliente c,venta v,venta_producto vp,producto p
	where c.idcliente = v.idcliente 
	and v.idventa = vp.idventa 
	and vp.idproducto = p.idproducto
	and extract(month from v.fechaventa)>6
	group by c.idcliente,c.nombre
	having sum(p.precio*vp.cantidad) = (select max(total_semestre.total)
from (
	select c.nombre cliente,sum(p.precio*vp.cantidad) total 
	from cliente c,venta v,venta_producto vp,producto p
	where c.idcliente = v.idcliente 
	and v.idventa = vp.idventa 
	and vp.idproducto = p.idproducto
	and extract(month from v.fechaventa)>6
	group by c.idcliente,c.nombre
)as total_semestre);

--9

with cantidad_cat_cliente as (
	select c.idcliente cliente,cat.idcategoria categoria,sum(vp.cantidad) cantidad
	from cliente c join venta v on c.idcliente = v.idcliente 
	join venta_producto vp on v.idventa = vp.idventa 
	join producto p on vp.idproducto = p.idproducto 
	join categoria cat on p.idcategoria = cat.idcategoria
	group by c.idcliente ,cat.idcategoria 
	order by cat.idcategoria,c.idcliente
)
select cat.nombre categoria,c.nombre cliente,cantidad_cat_cliente.cantidad
from cantidad_cat_cliente,cliente c,categoria cat
where cantidad_cat_cliente.cliente = c.idcliente and cantidad_cat_cliente.categoria = cat.idcategoria  
and (cantidad_cat_cliente.categoria,cantidad_cat_cliente.cantidad) 
in
(select cantidad_cat_cliente.categoria categoria,min(cantidad_cat_cliente.cantidad) min_cant
from cantidad_cat_cliente
group by cantidad_cat_cliente.categoria);



--10 
with prod_por_dep as (
	select d.iddepartamento dep,p.idproducto prod,sum(vp.cantidad*p.precio) cantidad
	from departamento d join ciudad ci on d.iddepartamento = ci.iddepartamento 
	join cliente c on c.idciudad = ci.idciudad join venta v on v.idcliente = c.idcliente 
	join venta_producto vp on vp.idventa = v.idventa join producto p on p.idproducto = vp.idproducto 
	group by d.iddepartamento,p.idproducto)
select d.nombre departamento, p.nombre producto, prod_por_dep.cantidad monto_recaudado
from prod_por_dep join departamento d on prod_por_dep.dep=d.iddepartamento 
join producto p on prod_por_dep.prod = p.idproducto 
where(prod_por_dep.dep,prod_por_dep.cantidad) 
in 
(
	select prod_por_dep.dep,min(prod_por_dep.cantidad) 
	from prod_por_dep
	group by prod_por_dep.dep
);

