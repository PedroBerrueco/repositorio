package e6u3mayorsecuenciade3;

import java.util.Scanner;

public class E6U3MayorSecuenciade3 {

	public static void main(String[] args) {

		Scanner sc = new Scanner(System.in);

		int array[] = new int[9];
		int suma = 0;
		int elmas = 0;
		int elmasant = 0;
		int elmassig = 0;

		//Pido los números al usuario
		for (int i = 0; i < array.length; i++) {
			System.out.print("Numero " + (i + 1) + ": ");
			array[i] = sc.nextInt();
		}
		//Por cada posición del Array sumare el valor del indice actual, indice anterior e indice posterior.
		// Si la nueva suma es mayor que la variable suma, actualizo mis parametros con estos datos.
		for (int i = 0; i < array.length; i++) {
			//Condicion espcial solo para cuando estamos en la primera posición (evitar out of bounds.)
			if (i == 0) {
				suma = (array[i] + array[i + 1]);
				elmasant = 0;
				elmas = array[i];
				elmassig = array[i + 1];
			}
			//Condicion especial solo para cuando estamos en la ultima posición (evitar out of bounds.)
			if (i == array.length - 1) {
				if (suma < (array[i - 2] + array[i - 1] + array[i])) {
					suma = (array[i - 2] + array[i - 1] + array[i]);
					elmasant = array[i - 2];
					elmas = array[i - 1];
					elmassig = array[i];
				}
			}
			//condicion para el resto de casos
			if ((i != 0) && (i != (array.length - 1))) {
				if (suma < (array[i - 1] + array[i] + array[i + 1])) {
					suma = (array[i - 1] + array[i] + array[i + 1]);
					elmasant = array[i - 1];
					elmas = array[i];
					elmassig = array[i + 1];
				}
			}

		}
		System.out.println(elmasant + "-" + elmas + "-" + elmassig);

	}

}
