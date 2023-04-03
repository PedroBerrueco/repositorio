use macking;
-- 1
select p.Nombre, pr.Nutriscore from producto p
join principal pr on p.Cod_producto = pr.Cod_producto;
-- 2
select p.Nombre, pr.Nutriscore from producto p
left join principal pr on p.Cod_producto = pr.Cod_producto;
-- 3 
select mp.nombre_menu, p.Nombre from menu_producto mp 
inner join producto p on mp.cod_producto = p.cod_producto order by 1; 
-- 4
select Nombre_menu, Porc_descuento from promocion where valido_hasta > sysdate();
-- 5
select p.Nombre, pro.Nombre from producto p 
inner join proveedor pro on p.Cif_proveedor = pro.Cif;
-- 6
select p.Nombre, pro.Nombre from producto p 
left join proveedor pro on p.Cif_proveedor = pro.Cif;
-- 7
select m.Nombre, p.Porc_descuento, r.Nombre from menu m
inner join regalo r on m.Cod_regalo = r.Cod_regalo
inner join promocion p on m.Nombre = p.Nombre_menu and Valido_hasta > sysdate();
-- 8
select AVG(precio_venta) media_pvp, Categoria from producto pro
inner join principal pri on pro.Cod_producto = pri.Cod_producto
group by categoria;
-- 9A
select p.Nombre as Prod_Quita, p2.Nombre as Prod_Pone, pri.Nutriscore as Nutri_Quita, pri2.Nutriscore as Nutri_Pone
from sustituible s
left join producto p on s.Cod_prod_quita =  p.Cod_producto
left join producto p2 on s.Cod_prod_pone =  p2.Cod_producto
left join principal pri on s.Cod_prod_quita = pri.Cod_producto
left join principal pri2 on s.Cod_prod_pone = pri2.Cod_producto
HAVING pri.Nutriscore = pri2.Nutriscore;
-- 9B
select m.Nombre, m.precio, sum(mp.unidades) AS numart from menu_producto mp
inner join menu m on mp.Nombre_Menu = m.Nombre 
group by Nombre ;