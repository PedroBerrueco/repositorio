Proceso Ejercicio5
	Definir number, contador, i Como Entero;
	contador <- 0;
	number <- 0;
	
	
	Escribir "Ingrese un n�mero y descubra si es primo: ";
	Leer number;
	
	//Vamos diviendo en n�mero hastas llegar a la raiz cuadrada de este.
	//Cada vez que el resto sea 0, actualizamos contador.
	Para i <- 1 Hasta raiz(number) Hacer
		Si (number % i = 0) Entonces;
			contador <- contador +1;
		FinSi
	FinPara
	
	//Todos los n�meros se pueden divir por uno.
	//As� que el contador deber� ser mayor para no primos
	SI (contador > 1 ) Entonces
		Escribir "El n�mero ", number , " no es primo." ;
	SiNo
		Escribir "El n�mero ", number , " es primo." ;
		
	FinSi
FinProceso
