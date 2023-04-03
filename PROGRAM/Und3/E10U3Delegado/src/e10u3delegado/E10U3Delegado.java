package e10u3delegado;

import java.util.Scanner;

public class E10U3Delegado {

	public static void main(String[] args) {

		Scanner sc = new Scanner(System.in);
		int[] array = new int[30];
		int numero = 1;
		// Pide el numero, guarda su valor y comprueba si es 10.
		for (int i = 0; i < array.length; i++) {
			if (numero != 0) {
				System.out.print("Alumno " + (i + 1) + ": ");
				array[i] = sc.nextInt();
				numero = array[i];
			}

		}
		int contador = 0;
		int[] votos = new int[30];

		for (int i = 0; i < array.length; i++) {
			for (int j = 0; j < array.length; j++)
				if ((array[i] == array[j]) && (array[i] != 0))
					contador++;
			votos[i] = contador;
			contador = 0;
		}
		int mayor = 0;
		int alumayor = 0;
		boolean empate = false;

		for (int i = 0; i < votos.length; i++) {
			if (mayor < votos[i]) {
				mayor = votos[i];
				alumayor = array[i];
				empate = false;
			}

			if ((alumayor != array[i]) && (mayor == votos[i])) {
				empate = true;
			}

		}
		int ganador = 0;
		for (int i = 0; i < votos.length; i++) {
			if (mayor == votos[i]) {
				ganador = array[i];
			}
		}

		if (empate == true) {
			System.out.println("empate");

		} else {
			System.out.println(ganador);
		}
	}

}
