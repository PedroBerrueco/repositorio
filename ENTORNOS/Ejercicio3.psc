Proceso Ejercicio3
	Definir mes como Entero;
	Escribir sin saltar "Dime el n�mero del mes (1-12): ";
	Leer mes;
	Si ((mes > 0) Y (mes < 13)) Entonces		
		Segun mes Hacer
			2:
				Escribir "El mes ", mes , " tiene 28 d�as";
			4, 6, 9, 11:
				Escribir "El mes ", mes , " tiene 30 d�as";
			De Otro Modo:
				Escribir "El mes ", mes ," tiene 31 d�as";
		FinSegun
		SiNo
		Escribir "Introduzca un n�mero de mes v�lido";
	FinSi
FinProceso
