Proceso Ejercicio2
	//Definimos tambi�n una variable auxiliar que nos ayudar� en la conversi�n.
	Definir num1, num2, num3, aux como Entero;
	Escribir "Dime el n�mero 1: ";
	Leer num1;
	Escribir "Dime el n�mero 2: ";
	Leer num2;
	Escribir "Dime el n�mero 3: ";
	Leer num3;
	//Ordenamos los numeros 1 y 2 siempre que uno sea m�s peque�o que dos.
	Si (num1 < num2) Entonces
		aux <- num2;
		num2 <- num1;
		num1 <- aux;
	FinSi
	//Ordenamos los numeros 1 y 3 siempre que uno sea m�s peque�o que tres.
	Si (num1 < num3) Entonces
		aux <- num3;
		num3 <- num1;
		num1 <- aux;
	FinSi
	//Ordenamos los numeros 2 y 3 siempre que dos sea m�s peque�o que tres.
	Si (num2 < num3) Entonces
		aux <- num3;
		num3 <- num2;
		num2 <- aux;
	FinSi
	Escribir num1, " ", num2, " ", num3;
FinProceso
