use macking;
-- 1 Muestra todos los productos, del más caro al más barato (precio de venta).
	SELECT * FROM producto ORDER BY Precio_venta DESC;
-- 2 Muestra los 10 productos más baratos (precio de venta).
	SELECT * FROM producto ORDER BY Precio_venta LIMIT 10;
-- 3 Muestra el precio más caro de un menú.
	SELECT MAX(Precio) FROM menu;
-- 4 Muestra la categoría y el precio de venta más caro de cada categoría de producto.
	SELECT Categoria, MAX(Precio_Venta) FROM producto GROUP BY Categoria;
-- 5 Muestra el nombre y precio del menú más caro.
    SELECT Nombre, MAX(Precio) FROM menu; 
-- 6 Muestra los menús con un precio de más de 8 euros, ordenados alfabéticamente por el nombre.
	SELECT * FROM menu WHERE Precio > 8.00 ORDER BY 1 ;
-- 7 Lista el nombre, precio de venta y stock de los productos con un precio de venta menor a 3 euros y con stock mayor a 10 unidades.
	SELECT Nombre, Precio_Venta, Stock FROM producto WHERE Precio_Venta < 3.00 AND Stock > 10;
-- 8 Muestra cuántos productos hay en total.
	SELECT COUNT(*) FROM producto;
-- 9 Muestra el precio de venta total de todos los productos de cada categoría.
	SELECT Categoria, SUM(Precio_Venta) FROM producto GROUP BY Categoria;
-- 10 Muestra cuántos productos hay de cada categoría, ordenando el listado de más a menos productos.
	SELECT Categoria, COUNT(Nombre) FROM producto GROUP BY Categoria ORDER BY 2 DESC; 
-- 11 Muestra cuántos productos veganos hay de cada categoría.
	SELECT Categoria, COUNT(Nombre) FROM producto WHERE Vegano is true GROUP BY Categoria; 
-- 12 Muestra cuántos productos hay en total (sin distinguir por categoría) de las categorías ‘Hamburguesas’ y ‘Refrescos’.
	SELECT COUNT(*) FROM producto WHERE Categoria in ('Hamburguesas', 'Refrescos');
-- 13 Muestra cuántos productos hay de la categoría ‘Hamburguesas’, y cuántos hay de la categoría ‘Refrescos’ (con una única instrucción).
	SELECT COUNT(*), Categoria FROM producto WHERE Categoria in ('Hamburguesas', 'Refrescos') GROUP BY Categoria;
-- 14 Muestra los nutriscore de los productos principales, sin repetirlos.
	SELECT DISTINCT(Nutriscore) FROM principal;
-- 15 Lista la media de precio de venta de los productos de cada categoría, pero solo cuando la media sea mayor o igual a 2 euros.
	SELECT Categoria, AVG(Precio_Venta) FROM producto GROUP BY Categoria HAVING AVG(Precio_Venta) >= 2;
-- 16 Lista cuántos productos hay de cada proveedor.
	SELECT pv.Nombre, COUNT(*) FROM producto p left join proveedor pv on p.Cif_proveedor = pv.Cif GROUP BY Cif_proveedor;
-- 17 Lista cuántos productos hay de cada proveedor y la media de precio de proveedor de cada uno (en la misma instrucción).
	SELECT pv.Nombre, COUNT(*), AVG(Precio_Venta) FROM producto p left join proveedor pv on p.Cif_proveedor = pv.Cif GROUP BY Cif_proveedor;
-- 18 Lista cuántos productos hay de cada proveedor, pero en el listado no debe aparecer ninguna fila sin cif de proveedor.
	SELECT pv.Nombre, Cif, COUNT(*) FROM producto p join proveedor pv on p.Cif_proveedor = pv.Cif GROUP BY Cif_proveedor;
-- 19 Piensa dos consultas que pudiesen ser útiles para el funcionamiento del establecimiento que incluyan GROUP BY y/o ORDER BY, explica lo que quieres obtener con cada una de ellas y para qué sirven, y muestra el código SQL y el resultado de su ejecución.
-- 19a Listar los menús que han estado adscritos a una promoción, ordenador por fecha de validez para tener arriba las últimas en caducar, tambien se desea conocer el precio del menú cno y sin promoción.
	SELECT p.Nombre_menu, p.Num_promo, p.Valido_Hasta, m.Precio, (m.Precio - (m.Precio * p.Porc_descuento)/100) as Precio_promo 
    FROM menu m inner join promocion p on m.Nombre = p.Nombre_menu order by 3 desc;
-- 19b Se desea conocer cuantos tipos de regalos tenemos disponibles agrupados por edad minima recomendada.
    SELECT Edad_minima, count(*) FROM regalo group by 1;
    