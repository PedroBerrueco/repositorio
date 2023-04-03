package pedroberruecound5;

import java.util.Scanner;

public class E5U5SumaUno {
	
	// No he sabido plantear la lógica para cualquier longitud que introdujera el
	// usuario, asi que lo resuelvo solo con 1 o 2.
	private StringBuilder doscifras(String numerohexa) {
		char base[] = { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F' };
	

		// Si el usuario introduce una sola cifra, ponemos un 0 delante.
		StringBuilder nuevohexa = new StringBuilder(numerohexa);
		if (numerohexa.length() == 1) {
			nuevohexa.insert(0, "0");
		}
		
		char pri = nuevohexa.charAt(0);
		char seg = nuevohexa.charAt(1);
		char primer = 0;
		char segun = 0;
		// Si el número es FF, saltamos la lógica y devolvemos un 100.
		if (pri == 'F' && seg == 'F') {
			String ff = "100";
			StringBuilder ffbuilder = new StringBuilder(ff);
			nuevohexa = ffbuilder;
		}

		// SI la segunda cifra es 'F' esta tornara a 0 y la primera aumentara una
		// posición en el array.
		if (pri != 'F' && seg == 'F') {
			for (int i = 0; i < base.length; i++) {
				if (base[i] == pri) {
					primer = base[i + 1];
					segun = '0';
				}
			}
			nuevohexa.setCharAt(0, primer);
			nuevohexa.setCharAt(1, segun);
		}
		// Para el resto de casos aumentará el segundo caracter en 1.
		if (seg != 'F') {
			for (int j = 0; j < base.length; j++) {
				if (seg == base[j]) {
					segun = base[j + 1];
					primer = pri;
				}
			}
			nuevohexa.setCharAt(0, primer);
			nuevohexa.setCharAt(1, segun);
		}
		// Devolvemos nuevohexa.
		return nuevohexa;
	}

	private StringBuilder milcifras(String numerohexa) {

		// Para completar el programa y que también calculara los número de + de 2 cifras,
		// decidí tirar por la calle de enmedio y hacer lo fácil.
		// Lo convierto a decimal, sumo uno y lo reconvierto a hexadecimal.
		int decimal = Integer.parseInt(numerohexa, 16);
		decimal++;
		String resultado = Integer.toHexString(decimal);

		StringBuilder nuevohexa = new StringBuilder(resultado);

		return nuevohexa;
	}

	public static void main(String[] args) {
		// INICIO
		// declaro variables y constantes
		Scanner teclado = new Scanner(System.in);
		boolean Novale = true;
		final StringBuilder resultado;
		String numerohexa;
		final String Rango = "0123456789ABCDEF";

		// Controlo que cada caracter sea un número valido para poder continuar.
		do {
			System.out.print("Escriba un número hexadecimal: ");
			String numero = teclado.nextLine();
			numerohexa = numero.toUpperCase();

			for (int i = 0; i < numerohexa.length(); i++) {
				char letra = numerohexa.charAt(i);
				if (Rango.contains(String.valueOf(letra))) {
					Novale = false;
				} else {
					Novale = true;
				}
			}
		} while (Novale);

		teclado.close();

		// PROCESO

		// Si el número tiene más de dos digitos vete al método "milcifras".
		if (numerohexa.length() > 2) {
			E5U5SumaUno masdetres = new E5U5SumaUno();
			resultado = masdetres.milcifras(numerohexa);
		// Sino vete al metodo "doscifras".
		} else {
			E5U5SumaUno menosdetres = new E5U5SumaUno();
			resultado = menosdetres.doscifras(numerohexa);
		}

		// SALIDA
		System.out.println(resultado);

	}
}
