Proceso Ejercicio5
	Definir number, contador, i Como Entero;
	contador <- 0;
	number <- 0;
	
	
	Escribir "Ingrese un número y descubra si es primo: ";
	Leer number;
	
	//Vamos diviendo en número hastas llegar a la raiz cuadrada de este.
	//Cada vez que el resto sea 0, actualizamos contador.
	Para i <- 1 Hasta raiz(number) Hacer
		Si (number % i = 0) Entonces;
			contador <- contador +1;
		FinSi
	FinPara
	
	//Todos los números se pueden divir por uno.
	//Así que el contador deberá ser mayor para no primos
	SI (contador > 1 ) Entonces
		Escribir "El número ", number , " no es primo." ;
	SiNo
		Escribir "El número ", number , " es primo." ;
		
	FinSi
FinProceso
