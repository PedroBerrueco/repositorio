package e4u6quienempieza;

import java.lang.reflect.Array;
import java.util.ArrayDeque;
import java.util.Arrays;
import java.util.List;
import java.util.Queue;
import java.util.Scanner;

public class E4U6QuienEmpieza {

	private static boolean isNumeric(String cadena) {
		try {
			Integer.parseInt(cadena);
			return true;
		} catch (NumberFormatException nfe) {
			return false;
		}
	}

	static java.util.Scanner in;

	public static void main(String[] args) {

		// INICIO
		Scanner sc = new Scanner(System.in);
		List<Integer> lista = Arrays.asList(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21,
				22, 23, 24, 25);
		ArrayDeque<Integer> alumnos = new ArrayDeque<>(lista);
		boolean valido = false;
		boolean esnum = false;
		int numero = 0;

		// COMPROBACION ENTERO
		do {
			System.out.println("Escriba un número de alumno: ");
			String cadena = sc.nextLine();
			// Llama a isNumeric
			if (isNumeric(cadena)) {
				numero = Integer.parseInt(cadena);
				esnum = true;
			}
			if (numero > 0 && numero < 26) {
				valido = true;
			}
		} while (!valido || !esnum);
		sc.close();

		// Proceso

		while (alumnos.size() != 1) {
			for (int i = 0; i < numero; i++) {
				alumnos.offer(alumnos.poll());
				}
			System.out.println("Se libra el  alumno: " + alumnos.poll());
		}

		// Salida
		System.out.println("Le toca al alumno alumno: " + alumnos.peek());

	}

}
