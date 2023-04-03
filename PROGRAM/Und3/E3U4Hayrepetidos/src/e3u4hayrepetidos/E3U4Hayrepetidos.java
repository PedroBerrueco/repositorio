package e3u4hayrepetidos;

import java.util.Arrays;
import java.util.Scanner;

public class E3U4Hayrepetidos {

	public static void main(String[] args) {
		
		Scanner sc = new Scanner(System.in);
		int array[] = new int[6];
		int aux = array[0];
		boolean repetido = false;
		
		//Pedimos al usuario los valores del array.
		for (int i = 0; i < array.length; i++) {
			System.out.print("Numero " + (i + 1) + ": ");
			array[i] = sc.nextInt();

		}

		// Ordenacion del array para que si hay dos indices iguales aparezca uno detrás del otro.
		Arrays.sort(array);
		
		//Comparar cada elemento del array con el anterior.
		for (int j = 0; j < array.length; j++) {
			if (aux == array[j]) {
				repetido = true;
			} else {
				aux = array[j];
			}

		}
		//imprime un mensaje en funcion de la condicion.
		 
		if (repetido == true) {
			System.out.println("SÍ");
		} else {
			System.out.println("NO");
		}
	}
}
