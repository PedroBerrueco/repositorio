package pedroberruecound5;

import java.util.Scanner;

public class E4U5TextoConAmor {

	public static void main(String[] args) {

		// Defino las variables
		Scanner teclado = new Scanner(System.in);
		String amor = "";
		int contador = 0;
		int a = 0;
		int m = 0;
		int o = 0;
		int r = 0;
		// No controlo lo que introduce el usuario, todo me vale.
		System.out.print("Escriba un texto: ");
		String cadena = teclado.nextLine();

		// Creo dos cadenas de tipo StringBuilder, una para rescatar las letras que me
		// interesan y otra para almacenarlas.
		StringBuilder cadenaS = new StringBuilder(cadena);
		StringBuilder Encadena2 = new StringBuilder("");

		// recorro la cadena y reviso cada letra, si el valor de caracter es a,m,o,r me
		// lo introduce en otra cadena con un espacio.
		for (int i = 0; i < cadenaS.length(); i++) {
			char letra = cadenaS.charAt(i);
			if ("amor".contains(String.valueOf(letra))) {
				Encadena2.append(letra);
				Encadena2.append(" ");
			}

		}

		// Convierto mi cadena en tipo String para poder trocearla.
		amor = Encadena2.toString();
		String[] trozos = amor.split(" ");

		// Recorro el array buscando cada letra de la palabra que marco solo si la
		// anterior también está marcada.
		for (int i = 0; i < trozos.length; i++) {
			if (trozos[i].equals("a")) {
				a = 1;
			}
			if (trozos[i].equals("m") && a == 1) {
				m = 1;
			}
			if (trozos[i].equals("o") && m == 1) {
				o = 1;
			}
			if (trozos[i].equals("r") && o == 1) {
				r = 1;
			}
			if (a == 1 && m == 1 && o == 1 && r == 1) {
				contador++;
				a = 0;
				m = 0;
				o = 0;
				r = 0; // SI todas están marcadas es que he encontrado una vez la palabra, aumento el
						// contador y pongo todas a 0 para seguir buscando.
			}
		}

		System.out.println(contador);

	}
}
