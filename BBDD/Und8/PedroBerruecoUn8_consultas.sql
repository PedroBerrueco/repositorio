
use macking;
-- 1
select * from menu;
-- 2
select Nombre, Precio_venta from producto;
-- 3
select * from producto where Stock = 0;
-- 4
select Cod_producto from principal where Nutriscore = 'B';
-- 5
select * from producto where Vegano is true and Categoria = 'Hamburguesas';
-- 6
select * from producto where Precio_venta = 0 or Precio_proveedor = 0;
-- 7
select * from producto where Nombre like 'Mc%';
-- 8
select * from producto where Nombre like '%a';
-- 9
select * from producto where Nombre like '%a%';
-- 10
select * from producto where Precio_venta <= Precio_proveedor;
-- 11
select * from producto where Peso > 100 order by Peso;
-- 12
select * from producto where Vegano is true and (Precio_venta between 1.01 and 1.99);
-- 13
select * from producto where Vegano is not true and stock > 0 and Categoria = 'Postres';
-- 14
select * from producto where Categoria in ('Postres','Bebidas','Hamburguesas');
-- 15
select * from menu where Cod_regalo is null;
-- 16
select * from menu where Cod_regalo is not null;
-- 17
select Nombre, Precio_venta - Precio_proveedor as Ganancia from producto;
-- 18
select Nombre, Precio_venta - Precio_proveedor as Ganancia from producto where (Precio_venta - Precio_proveedor) > 1;
-- 19a
select p.Cod_producto, pro.Nombre, p.Nutriscore from principal p inner join producto pro on p.Cod_producto = pro.Cod_producto where p.Nutriscore = 'B';
-- 19b
select p.Cod_producto, p.Nombre, p.Precio_venta, m.Nombre, m.Precio from producto p inner join menu_producto mp on p.Cod_producto = mp.Cod_producto inner join menu m on mp.Nombre_menu = m.Nombre where m.Nombre = 'King Pika';
 