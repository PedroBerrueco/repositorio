-- Ejercicio A.

	-- OPCION 1 - mediante PL/SQL.
	DECLARE
		-- Variables para almacenar los nombres de tabla y columna
		tabla_origen VARCHAR(20):= 'PRODUCTO';
		tabla_destino VARCHAR(20):= 'HIST_PRODUCTO';
		campo_origen VARCHAR2(30);
		tipo_origen VARCHAR2(30);
		primer BOOLEAN :=TRUE;

		CURSOR recorre IS SELECT column_name, data_type FROM user_tab_columns WHERE table_name = tabla_origen;

	BEGIN
		-- Loop para obtener los nombres de las columnas de la tabla original
		FOR c IN recorre LOOP
			-- Obtener el nombre y tipo de dato de columna actual
			campo_origen := c.column_name;
			tipo_origen := c.data_type;
			-- Verificar si es la primera iteración
			IF primer THEN
				EXECUTE IMMEDIATE 'CREATE TABLE ' || tabla_destino || ' (' || campo_origen || ' ' || tipo_origen || '(30) PRIMARY KEY)';
				primer:= FALSE;
			ELSE 
			-- Verificar el tipo de dato.
				IF tipo_origen = 'VARCHAR2' THEN 
					EXECUTE IMMEDIATE 'ALTER TABLE ' || tabla_destino || ' ADD (' || campo_origen || ' ' || tipo_origen || '(30))';
				ELSE IF tipo_origen = 'NUMBER' THEN
					EXECUTE IMMEDIATE 'ALTER TABLE ' || tabla_destino || ' ADD (' || campo_origen || ' ' || tipo_origen || '(4,2))';
				ELSE 
					EXECUTE IMMEDIATE 'ALTER TABLE ' || tabla_destino || ' ADD (' || campo_origen || ' ' || tipo_origen || ')';
				END IF;
				END IF;
			END IF;
		END LOOP;
	END;
/
	-- OPCION 2 - Mediante SQL.

	CREATE TABLE HIST_PRODUCTO AS
	SELECT *
	FROM PRODUCTO
	WHERE 1 = 2;

/

-------------------------------------------------------------------------------------------------------------------

-- Ejercicio B.

DECLARE
	v_cod VARCHAR(20);
    v_nom VARCHAR(20);
	CONTADOR INTEGER := 0;
	-- Se crea un cursor que recorre la consulta solicitada.
	CURSOR recorre IS SELECT * FROM PRODUCTO where IND_SITU = 'B';
BEGIN
	-- Bucle FOR para utilizar el cursor antes declarado.
	FOR c in RECORRE LOOP
		-- En cada iteracion del bucle asignamos valor a las variables que mostaran el valor de los campos solicitados.
    	v_cod := c.COD_PRODUCTO;
        v_nom := c.NOMBRE;
		-- Sacamos por pantalla el valor del nombre y codigo de producto por cada iteración.
    	DBMS_OUTPUT.PUT_LINE('El codigo del producto es ' || v_cod || ' y el nombre es ' || v_nom );
		-- Borramos de la tabla MENU_PRODUCTO el producto resultante de cada iteración.
		-- Esto eliminara esos productos de los menús.
		DELETE FROM MENU_PRODUCTO WHERE COD_PRODUCTO = c.COD_PRODUCTO;
		-- Insertamos cada producto en la tabla HIST_PRODUCTO, con todos sus campos.
		INSERT INTO HIST_PRODUCTO VALUES (c.COD_PRODUCTO, c.NOMBRE, c.HORA_DESDE, c.HORA_HASTA, c.PRECIO_PROVEEDOR, c.PRECIO_VENTA, c.STOCK, c.PESO, c.VEGANO, c.CATEGORIA, c.CIF_PROVEEDOR, c.IND_SITU);
		-- Se suma 1 por cada iteracion a un contador que usaremos más adelante.
		CONTADOR := CONTADOR + 1;
	END LOOP;
		
		-- Si la consulta devolvió mas de un registro el contador será mayor que 0 y se muestra el núemro de registros copiados.
		-- Si la consulta no delvió registros y no se copio ninguna también lo indicará.
		IF CONTADOR > 0 THEN
            DBMS_OUTPUT.PUT_LINE('Se han copiado ' || CONTADOR || ' registros a la BD HIST_PRODUCTO.');
		ELSE 
            DBMS_OUTPUT.PUT_LINE('No se han copiado registros a la BD HIST_PRODUCTO');
        END IF;
END;
/

-----------------------------------------------------------------------------------------------------------------------------

-- EJercicio C

/*
Para completar la actividad he creado las consultas siguientes que ejecutaré antes y despues de
lanzar el PLSQL:
*/

-- Productos sobre los que actuara PL/SQL
SELECT Cod_Producto, Nombre FROM producto WHERE ind_situ = 'B';

--De los productos mostrados arriba, se especifican los incluidos en algún menú.
SELECT * FROM menu_producto WHERE COD_PRODUCTO IN (SELECT Cod_Producto FROM producto
WHERE ind_situ = 'B');

-- Productos de alta en la tabla hist_producto
SELECT * FROM HIST_PRODUCTO;

--Lanzamos PL/SQL

-- Productos sobre los que actuó PL/SQL (Siguen siendo los mismos)
SELECT Cod_Producto, Nombre FROM producto WHERE ind_situ = 'B';

--De los productos mostrados arriba, se especifican los incluidos en algún menú. (Ya no quedaninguno).
SELECT * FROM menu_producto WHERE COD_PRODUCTO IN (SELECT Cod_Producto FROM producto
WHERE ind_situ = 'B');

-- Productos de alta en la tabla hist_producto. (Ahora aparecen los 3).
SELECT * FROM HIST_PRODUCTO;


