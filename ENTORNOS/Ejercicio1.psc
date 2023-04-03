Proceso Ejercicio1
		Definir nombre, apellido1, apellido2, ininom, iniape1, iniape2 como Cadena;
		Escribir "Dime tu nombre:";
		Leer nombre;
		Escribir "Dime tu primer apellido:";
		Leer apellido1;
		Escribir "Dime tu segundo apellido:";
		Leer apellido2;
		//He creado tres iniciales porque no sabía cómo meter todas las iniciales en 1.
		ininom <- SubCadena(nombre, 0,0);
		iniape1 <- Subcadena(apellido1,0,0);
		iniape2 <- Subcadena(apellido2,0,0);
		Escribir "Las iniciales son: ", ininom, iniape1, iniape2;
FinProceso
