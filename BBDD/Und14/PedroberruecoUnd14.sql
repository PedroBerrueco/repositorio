-- EJERCICIO A (CREAR PROCEDIMIENTO LISTADOR)
    -- Tenemos dos parametros, uno de entra que indica que sentencia ejecutar. Y uno de salida con la cuenta de reistros. 
    CREATE OR REPLACE PROCEDURE parlistar (opcion IN CHAR, salida OUT NUMBER) 
    AS
        -- Creamos un cursos por cada consulta y una variable a modo de contador.
        i NUMBER := 1; 
    	CURSOR curA IS select COD_PRODUCTO, NOMBRE, PRECIO_VENTA, STOCK from PRODUCTO where STOCK > 0 AND IND_SITU ='A';
    	CURSOR curB IS select COD_PRODUCTO, NOMBRE, PRECIO_VENTA, STOCK from PRODUCTO where STOCK > 0 AND IND_SITU ='B';
    
    BEGIN
        --Tenemos 3 condiciones, que el parametro sea A,B u otra cosa.
        IF opcion = 'A' THEN
        	--Si el parámetro de entrada es 'A' ejecutamos la consulta para los artículos de ALTA.
        	SELECT COUNT (*) INTO salida FROM PRODUCTO where STOCK > 0 AND IND_SITU ='A';
        	FOR reg IN curA LOOP
        		DBMS_OUTPUT.PUT_LINE('Registro ' || i || '.=> Codigo:' || reg.COD_PRODUCTO || ', Nombre:' || reg.NOMBRE || ', Precio_Venta:' || reg.PRECIO_VENTA || ',Stock:' || reg.STOCK);
    			i := i + 1;
    			-- El contador es simplemente para adornar la línea de salida y paginar los registros en pantalla.
    		END LOOP;
    	 ELSE IF opcion = 'B' THEN
            --Si el parámetro de entrada es 'B' ejecutamos la consulta para los artículos de BAJA.
            SELECT COUNT (*) INTO salida FROM PRODUCTO where STOCK > 0 AND IND_SITU ='B';
            FOR reg IN curB LOOP
        		DBMS_OUTPUT.PUT_LINE('Registro: ' || i || '. Codigo: ' || reg.COD_PRODUCTO || ', Nombre: ' || reg.NOMBRE || ', Precio_Venta: ' || reg.PRECIO_VENTA || ',Stock: ' || reg.STOCK);
    		 	i := i + 1;
    		END LOOP;
    	 ELSE
             --Si el parametro es cualquier otra cosa, mostramos un mensaje de error.
             DBMS_OUTPUT.PUT_LINE('FATAL ERROR - INVALID PARAM');
    		END IF;
    	END IF;
    END;
    /

-- EJERCICIO B (CREAR FUNCIÓN BAJA PRECIOS)
    -- La función no recibe parámetros pero devuelve un entero.
    CREATE OR REPLACE FUNCTION descuento50 
		RETURN INTEGER
	AS 
        cuantos INTEGER := 0;
	BEGIN
        -- El entero será la cuenta de los registros que vamos a rebajar.
		select count(*) into cuantos from producto where stock > 10;
		-- Con UPDATE modificamos los datos de la consulta.
    	update producto set precio_venta = (precio_venta/2) where stock > 10 and ind_situ = 'A';
	-- devolvemos el valor asignado a la variable "cuantos".
	RETURN cuantos;
	END;
/

--EJERCICIO C (CREAR CODIGO ANÓNIMO QUE LLAME A y B)

	DECLARE
    	-- variables para el procedimiento (opcion, parresponde)
    	opcion CHAR := 'A';
		parresponde NUMBER;
		--variable para la funcion (funcion).
		funcion NUMBER;
	BEGIN
        DBMS_OUTPUT.PUT_LINE('----  LLAMAMOS AL PROCEDIMIENTO "parlistar" con opcion ' || opcion || ' -----');
        -- Llamamos al Procedimiento con los dos parametros que necesita, uno de entrada y uno de salida.
        parlistar(opcion,parresponde);
		-- Formateamos la salida del parametro "salida" para que no muestro solo el número.
		DBMS_OUTPUT.PUT_LINE('Se han obtenido ' || parresponde || ' registros.');
		DBMS_OUTPUT.PUT_LINE('                        ');
		DBMS_OUTPUT.PUT_LINE('----  LLAMAMOS A LA FUNCION "descuento50"  ------');
		--LLamamos a la función sin parametros e introducimos su valor en una variable.
		funcion := descuento50();
		-- Sacamos listado de productos rebajados.
		DBMS_OUTPUT.PUT_LINE('Se ha rebajado al 50% el precio de ' || funcion || ' articulos exitosamente.' );
		DBMS_OUTPUT.PUT_LINE('                        ');
		DBMS_OUTPUT.PUT_LINE('----  LLAMAMOS AL PROCEDIMIENTO "parlistar" (otra vez)  ------');
		parlistar(opcion,parresponde);
		DBMS_OUTPUT.PUT_LINE('Se han obtenido ' || parresponde || ' registros.');
	END;