Proceso Ejercicio4
	Definir number, suma, cuenta como entero;
	Definir media Como Real;
	number <- -1;
	suma <- 0;
	media <- 0.0;
	cuenta <- 0;
	//Hasta que escribas un 0 ve preguntando números y almacenandolos.
	Mientras number <> 0 Hacer
		Escribir "Introducza un número entero. (Pulse 0 para salir): ";
		Leer number;
		suma <- suma + number;
		cuenta <- cuenta + 1;
	FinMientras
		// restamos uno a cuenta para que no cuente el último 0.
		cuenta <- cuenta -1;
		media <- suma / cuenta;
		
		//Si la cuenta es 0 no puedo realizar la división.
	Si media<>0 Entonces
		
		Escribir "La suma es: ", suma;
		Escribir "La media es: ", media;
	SiNo
		Escribir "No ha introducido ningún número.";
		Escribir "La suma es ", suma, " y la media es ", media;
	FinSi
	
FinProceso
