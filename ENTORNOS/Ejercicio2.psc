Proceso Ejercicio2
	//Definimos también una variable auxiliar que nos ayudará en la conversión.
	Definir num1, num2, num3, aux como Entero;
	Escribir "Dime el número 1: ";
	Leer num1;
	Escribir "Dime el número 2: ";
	Leer num2;
	Escribir "Dime el número 3: ";
	Leer num3;
	//Ordenamos los numeros 1 y 2 siempre que uno sea más pequeño que dos.
	Si (num1 < num2) Entonces
		aux <- num2;
		num2 <- num1;
		num1 <- aux;
	FinSi
	//Ordenamos los numeros 1 y 3 siempre que uno sea más pequeño que tres.
	Si (num1 < num3) Entonces
		aux <- num3;
		num3 <- num1;
		num1 <- aux;
	FinSi
	//Ordenamos los numeros 2 y 3 siempre que dos sea más pequeño que tres.
	Si (num2 < num3) Entonces
		aux <- num3;
		num3 <- num2;
		num2 <- aux;
	FinSi
	Escribir num1, " ", num2, " ", num3;
FinProceso
