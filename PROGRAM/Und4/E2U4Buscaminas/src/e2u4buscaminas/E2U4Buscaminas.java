package e2u4buscaminas;

import java.util.Scanner;

public class E2U4Buscaminas {

	public static void main(String[] args) {

		Scanner teclado = new Scanner(System.in);
		int nfila = 0;
		int ncolumna = 0;
		int contador = 0;
		
		String buscaminas[][] = new String[5][5];
		for (int i = 0; i < buscaminas.length; i++) { 
			for (int j = 0; j < buscaminas.length; j++) { 
				System.out.print("Introduzca coordenadas (" + i + "," + j + "): "); 
				buscaminas[i][j] = teclado.nextLine();
			}
		}
		
		
		
		//String buscaminas[][] = { { "-", "*", "-", "*", "-" }, { "*", "-", "-", "-", "*" }, { "-", "-", "*", "-", "-" },
		//		{ "-", "*", "-", "-", "-" }, { "*", "-", "-", "*", "-" } };
		/*
		 * String buscaminas[][] = new String[5][5];
		 * 
		 * for (int i = 0; i < buscaminas.length; i++) { for (int j = 0; j <
		 * buscaminas.length; j++) { System.out.print("Introduzca coordenadas (" + i +
		 * "," + j + "): "); buscaminas[i][j] = teclado.nextLine();
		 * 
		 * } }
		 */
		System.out.print("Introduzca la fila a comprobar: ");
		nfila = teclado.nextInt();
		System.out.print("Introduzca la columna a comprobar: ");
		ncolumna = teclado.nextInt();

		if ((nfila > 0) && (ncolumna > 0)) {
			for (int f = nfila - 1; ((f >= nfila - 1) && (f <= nfila + 1)) && ((f >= 0) && (f <= 4)); f++) {
				for (int c = ncolumna - 1; ((c >= ncolumna - 1) && (c <= ncolumna + 1))
						&& ((c >= 0) && (c <= 4)); c++) {
					if ((f != nfila) || (c != ncolumna)) {
						if (buscaminas[f][c].equals("*")) {
							contador++;
						}
			/*			System.out.print(f + "" + c);
						System.out.print(" ");
			*/
						}
				}
				

			}
		}
		else if ((nfila < 4) && (ncolumna < 4)) {
			for (int f = nfila + 1; ((f <= nfila + 1) && (f >= nfila - 1)) && ((f >= 0) && (f <= 4)); f--) {
				for (int c = ncolumna + 1; ((c <= ncolumna + 1) && (c >= ncolumna - 1))
						&& ((c >= 0) && (c <= 4)); c--) {
					if ((f != nfila) || (c != ncolumna)) {
						if (buscaminas[f][c].equals("*")) {
							contador++;
						}
			/*			System.out.print(f + "" + c);
						System.out.print(" ");
			*/
					}
				}
				

			}
			
		}
		System.out.println(contador);
	}
}
