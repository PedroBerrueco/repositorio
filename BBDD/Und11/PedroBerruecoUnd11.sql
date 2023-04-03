use macking;
-- 1.
	select a.categoria categoria, b.categoria cat_padre from categoria a inner join categoria b on b.Categoria = a.Categoria_padre;
-- 2. 
	select a.categoria, a.Texto_marketing, b.categoria cat_padre, b.Texto_marketing txt_padre from categoria a inner join categoria b on b.Categoria = a.Categoria_padre;
-- 3.
	select a.categoria, a.Texto_marketing, b.categoria cat_padre, b.Texto_marketing txt_padre from categoria a left join categoria b on b.Categoria = a.Categoria_padre;
-- 4. 
	select Cod_producto from producto where Cod_producto not in (select Cod_producto from menu_producto);
-- 5. 
	select * from categoria where Temp_almacenado > (select AVG(Temp_almacenado) from categoria);
-- 6. 
	select Nombre from producto where Precio_Venta > ANY (select precio from menu);
-- 7.
	-- 7a. ¿Qué categorías hijas tienen menor temperatura de almacenado que sus categorías padre?
	select a.Categoria, a.Temp_almacenado, b.Categoria cat_padre, b.Temp_almacenado temp_padre from categoria a 
    inner join categoria b on a.Categoria_padre = b.Categoria
    where a.Temp_almacenado < b.Temp_almacenado;
    
    -- 7b. Dame el nombre de los productos sustituibles y su sustituto.
	select  p.Nombre as Sustituible, p2.nombre as Sustituto from producto p 
    inner join sustituible s on p.Cod_producto = s.Cod_prod_quita
    inner join producto p2 on p2.Cod_producto = s.Cod_prod_pone;

-- 8. 
    -- 8a. Dime el nombre de los menús con regalo sin stock para niños.
    select Nombre from menu where Cod_regalo IN (select Cod_regalo from regalo where Edad_minima < 18 and stock = 0);
    
    -- 8b. ¿Qué artículos no aptos para veganos contiene cada menú?
    select Nombre_menu, Unidades, Nombre as Nombre_Producto from menu_producto mp
    inner join (select Cod_producto, Nombre from producto where vegano = 0) p on mp.Cod_producto = p.Cod_producto 
    
    