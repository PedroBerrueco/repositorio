-- EJERCICIO A 
DECLARE 
   CURSOR veggie IS SELECT * FROM producto WHERE vegano = 'T';
   nuevo_cod producto.cod_producto%TYPE;
   nuevoprecio producto.precio_venta%TYPE;
BEGIN
    
    SAVEPOINT papapatras; -- HACEMOS PUNTO DE SALVADO PREVIO.
	FOR reg IN veggie LOOP -- RECORREMOS LOS PRODCUTOS VEGANOS.
    	UPDATE producto SET precio_venta = (precio_venta + 1) WHERE cod_producto = reg.cod_producto ; --SUBIMOS EL PRECIO DE DICHOS PRODUCTOS.
    	SELECT cod_producto INTO nuevo_cod FROM producto WHERE producto.cod_producto = reg.cod_producto;
		SELECT precio_venta INTO nuevoprecio FROM producto WHERE producto.cod_producto = reg.cod_producto;
		DBMS_OUTPUT.PUT_LINE ('Código de producto : ' || nuevo_cod || ' y Precio de Venta actual: ' || nuevoprecio ); --MOSTRAMOS PRECIO Y PRODUCTO.
		DELETE FROM sustituible WHERE cod_prod_quita = reg.cod_producto; -- BORRAMOS EL PRODUCTO DE LA TABLA SUSTITUBLE SI LO SON.
	END LOOP;
	EXCEPTION  -- EN CASO DE APARECER CUALQUIER ERROR REALIZAMOS ROLLBACK.
        WHEN OTHERS THEN
    	    ROLLBACK TO papapatras;  
END;
/

-- EJERCICIO B 

DECLARE 
   CURSOR veggie IS SELECT * FROM producto WHERE vegano = 'T';
   masdecinco EXCEPTION; -- AÑADIMOS EXCEPCION EXPLÍCITA.
   nuevo_cod producto.cod_producto%TYPE;
   nuevoprecio producto.precio_venta%TYPE;
	
BEGIN
    
    SAVEPOINT papapatras;
	FOR reg IN veggie LOOP
    	UPDATE producto SET precio_venta = (precio_venta + 1) WHERE cod_producto = reg.cod_producto ;
    	SELECT cod_producto INTO nuevo_cod FROM producto WHERE producto.cod_producto = reg.cod_producto;
		SELECT precio_venta INTO nuevoprecio FROM producto WHERE producto.cod_producto = reg.cod_producto;
		DBMS_OUTPUT.PUT_LINE ('Código de producto : ' || nuevo_cod || ' y Precio de Venta actual: ' || nuevoprecio );
		DELETE FROM sustituible WHERE cod_prod_quita = reg.cod_producto;
		IF nuevoprecio > 5 THEN -- LA EXCEPCION SE LANZA EN CASO DE SER EL NUEVO PRECIO MAYOR QUE 5.
            RAISE masdecinco;
		END IF;
	END LOOP;
	EXCEPTION
        WHEN masdecinco THEN
        	DBMS_OUTPUT.PUT_LINE ('ERROR - ' || nuevo_cod ||' ha superado los 5€' ); --MOSTRAMOS MENSAJE DE LA NUEVA EXCEPCIÓN.
            ROLLBACK TO papapatras;  
        WHEN OTHERS THEN
    	    ROLLBACK TO papapatras;  
END;
/
    
-- EJERCICO C

DECLARE 
   CURSOR veggie IS SELECT * FROM producto WHERE vegano = 'T';
   masdecinco EXCEPTION;
   nuevo_cod producto.cod_producto%TYPE;
   nuevoprecio producto.precio_venta%TYPE;
   mcvegan INTEGER;
BEGIN
    --VALIDACION INICIAL.
    SELECT count(nombre) INTO mcvegan FROM producto WHERE nombre = 'Mc Vegana'; 
    IF mcvegan > 0 THEN -- AL CONTROLAR LA CONSULTA CON COUNT EVITAMOS LAS POSIBLES EXCEPCIONES "NO_DATA_FOUND" O "TOO_MANY_ROWS". 
        SAVEPOINT papapatras;
    	FOR reg IN veggie LOOP
        	UPDATE producto SET precio_venta = (precio_venta + 1) WHERE cod_producto = reg.cod_producto ;
        	SELECT cod_producto INTO nuevo_cod FROM producto WHERE producto.cod_producto = reg.cod_producto;
    		SELECT precio_venta INTO nuevoprecio FROM producto WHERE producto.cod_producto = reg.cod_producto;
    		DBMS_OUTPUT.PUT_LINE ('Código de producto : ' || nuevo_cod || ' y Precio de Venta actual: ' || nuevoprecio );
    		DELETE FROM sustituible WHERE cod_prod_quita = reg.cod_producto;
    		IF nuevoprecio > 5 THEN
                RAISE masdecinco;
    		END IF;
    	END LOOP;
	ELSE
        DBMS_OUTPUT.PUT_LINE ('No Hay Mc Vegana, no hacemos nada.' ); -- EL MENSAJE QUE OBTENDRIAMOS CON LA EXCEPCION LO SACAMOS EN EL ELSE.
	END IF;
    	EXCEPTION
            WHEN masdecinco THEN
            	DBMS_OUTPUT.PUT_LINE ('ERROR - ' || nuevo_cod ||' ha superado los 5€' );
                ROLLBACK TO papapatras;  
            WHEN OTHERS THEN
        	    ROLLBACK TO papapatras;  
END;
/

SELECT * FROM producto WHERE nombre = 'Mc Vegana';    
SELECT * FROM producto WHERE vegano = 'T';
SELECT * FROM sustituible;
delete from producto WHERE nombre = 'Mc Vegana';