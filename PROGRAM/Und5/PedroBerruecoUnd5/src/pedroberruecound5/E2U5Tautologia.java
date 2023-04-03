package pedroberruecound5;

import java.util.Scanner;

public class E2U5Tautologia {

	public static void main(String[] args) {

		// Defino variables
		Scanner teclado = new Scanner(System.in);
		boolean NoValido = true;
		String respuesta = "";
		String[] trozos;

	// Controlo que el usuario haya introducido 3 palabras en la cadena.
		do {
			System.out.println("Introduzca dos palabras a comparar: 'Ejemplo: Casa es casa': ");
			String cadena = teclado.nextLine();

			trozos = cadena.split(" ");
			if (trozos.length == 3) {
				NoValido = false;
			} else {
				System.out.println("Secuencia introducida no valida");
			}

		} while (NoValido);

	// Comparo la primera y la tercera palabra sin diferenciar mayúsculas.
		if (trozos[0].equalsIgnoreCase(trozos[2])) {
			respuesta = "SÍ";
		} else {
			respuesta = "NO";
		}
	// SALIDA
		System.out.println(respuesta);

	}

}
