USE macking;

-- PASO 1.
        CREATE USER enrique@'%' IDENTIFIED BY 'Enrique01!!';
        CREATE USER raul@'localhost' IDENTIFIED BY 'Raul02""';
        CREATE USER sandra@'localhost' IDENTIFIED BY 'Sandra03··';
        CREATE USER jesus@'localhost' IDENTIFIED BY 'Jesus04$$';
        CREATE USER pedro@'localhost' IDENTIFIED BY 'Pedro05%%';
        CREATE USER javier@'localhost' IDENTIFIED BY 'Javier06&&';
        CREATE USER ana@'%' IDENTIFIED BY 'Ana07//';

-- PASO 2.
		CREATE ROLE inse_cons;
        CREATE ROLE actu_cons;

-- PASO 3.
		GRANT INSERT ON macking.producto TO inse_cons;
        GRANT INSERT ON macking.principal TO inse_cons;
        GRANT INSERT ON macking.extra TO inse_cons;
        GRANT SELECT ON macking.categoria TO inse_cons;
		
        GRANT UPDATE ON macking.producto TO actu_cons;
        GRANT SELECT ON macking.principal TO actu_cons;

-- PASO 4.
		-- Asignamos privilegios individuales.
        GRANT SELECT ON *.* TO enrique@'localhost';
        GRANT DELETE ON *.* TO pedro@'localhost';
        GRANT ALL ON *.* TO ana@'%' WITH GRANT OPTION;
        -- Asignamos rol inse_cons a los usuarios.
        GRANT inse_cons TO raul@'localhost';
        GRANT inse_cons TO pedro@'localhost';
        GRANT inse_cons TO javier@'localhost';
        -- Asignamos rol actu_consu a los usuarios.
        GRANT actu_cons TO sandra@'localhost';
        GRANT actu_cons TO jesus@'localhost';
        GRANT actu_cons TO javier@'localhost';
	
		FLUSH PRIVILEGES;
-- PASO 5.
	-- Nos conectamos con el usuario de Enrique.
		USE macking;
        SET ROLE inse_cons;
		SELECT * FROM menu; -- OK
        DELETE FROM menu WHERE Nombre = 'Mc Desayuno 1'; -- NOT OK
	
    -- Nos conectamos con el usuario de Pedro.
		USE macking;
        SET ROLE inse_cons;
		SELECT * FROM regalo; -- NOT OK
        SELECT * FROM categoria; -- OK
		DELETE FROM menu WHERE Nombre = 'Mc Desayuno 2'; -- OK
		