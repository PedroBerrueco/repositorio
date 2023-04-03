Proceso Ejercicio3
	Definir mes como Entero;
	Escribir sin saltar "Dime el número del mes (1-12): ";
	Leer mes;
	Si ((mes > 0) Y (mes < 13)) Entonces		
		Segun mes Hacer
			2:
				Escribir "El mes ", mes , " tiene 28 días";
			4, 6, 9, 11:
				Escribir "El mes ", mes , " tiene 30 días";
			De Otro Modo:
				Escribir "El mes ", mes ," tiene 31 días";
		FinSegun
		SiNo
		Escribir "Introduzca un número de mes válido";
	FinSi
FinProceso
