-- CREAR DATABASE:
	CREATE DATABASE leasing;
	USE leasing;

	CREATE TABLE propietario (
	Dni VARCHAR(10),
	Nombre VARCHAR(50),
	Telefono VARCHAR(15),
	PRIMARY KEY (Dni)
	);

	CREATE TABLE vehiculo (
	Matricula VARCHAR(8),
	Marca VARCHAR(15),
	Modelo VARCHAR(15),
	Dni VARCHAR(10),
	PRIMARY KEY (Matricula),
	FOREIGN KEY(Dni) REFERENCES propietario(Dni) ON UPDATE CASCADE ON DELETE SET NULL
	);

-- EJERCICIO 1:
	INSERT INTO propietario (Dni,Nombre,Telefono) VALUES ('11111111V','Ramón Rodriguez','6785432');
	INSERT INTO propietario (Dni,Nombre,Telefono) VALUES ('22222222H','Jose Lopez','66678943');
	INSERT INTO propietario (Dni,Nombre,Telefono) VALUES ('33333333G','Carla Ponce','(26)655786542');
	
    INSERT INTO vehiculo (Matricula,Marca,Modelo,Dni) VALUES ('E7777CCC','Seat','ibiza',null);
	INSERT INTO vehiculo (Matricula,Marca,Modelo,Dni) VALUES ('E8888BBB','Honda','Civic','22222222H');
	INSERT INTO vehiculo (Matricula,Marca,Modelo,Dni) VALUES ('E9999FFF','Seat','León','33333333G');

-- EJERCICIO 2:
-- CASO A:
	Update propietario set Dni = '44444444K', Nombre = 'María Suarez' where Dni = '33333333G';
	/*
	Sí puede hacerse, al ejecutarse la actualización de datos en la tabla Propietario tambien se desencadena una actualización del campo Dni en la tabla vehiculo de los registros que tuvieran asociado el DNI del propietario modificado.
	Esto sucede porque al crear la tabla de se seleccionado una restricción en la FK " ON UPDATE CASCADE" que produce el efecto comentado anteriormente.
	*/
-- CASO B:
	UPDATE vehiculo SET Dni = '33333333G'WHERE Matricula = 'E9999FFF';
	/*
    No se puede hacer ya que el campo “Dni” de la tabla “vehículo” hace referencia al campo “Dni” de la tabla “propietario” y no puede introducirse ningún valor que no este creado en la tabla “propietario” previamente.
    */
    
    /*
    **Si quisiéramos modificar ese campo, al tener restricción en cascada, si habría una forma de realizarlo, pero habría que hacer el UPDATE sobre el campo DNI de la tabla “propietario” y esto provocaría que se efectuara también el cambio solicitado en la tabla vehículo. Pongo ejemplo de la sentencia que provocaría dicho cambio.
	*/
    UPDATE propietario SET Dni = '55555555P' WHERE Dni in 
	(SELECT  v.dni from vehiculo v INNER JOIN propietario p ON p.Dni = v.Dni WHERE v.matricula = 'E9999FFF');

-- EJERCICIO 3:
	DELETE FROM propietario where Dni = '22222222H';
	/*
    Sí puede hacerse, al tener la tabla una restricción “SET NULL” cualquier campo referenciado a este propietario en la tabla vehículo se establecerá como NULL. 
	SI hubiera tenido una restricción RESTRICT no nos hubiera permitido borrarlo, y si hubiera tenido una restricción CASCADE, también lo hubiera permitido, pero habría eliminado el registro de la tabla vehículo que le hace referencia.
	*/
-- EJERCICIO 4:
	/*
    Tendríamos que modificar la tabla y poner una restricción a la FK de tipo “RESTRICT”, para ello se debe buscar el nombre de la restricción y eliminarla con un comando “ALTER  TABLE”. Posteriormente creamos de nuevo la restricción sin especificar tipo de restricción ya que por defecto será RESTRICT.
    */
	ALTER TABLE `leasing`.`vehiculo` 
	DROP FOREIGN KEY `vehiculo_ibfk_1`;

	ALTER TABLE `leasing`.`vehiculo` 
	ADD CONSTRAINT `vehiculo_ibfk_1`
	  FOREIGN KEY (`Dni`)
	  REFERENCES `leasing`.`propietario` (`Dni`);
 

