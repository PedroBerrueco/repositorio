package e4u4sudoku;

import java.util.Scanner;

class Ordena {

	public void ordena(int[][] sudoku) {

		int t = 0;
		for (int i = 0; i < sudoku.length; i++) {// Ordena la matriz
			for (int j = 0; j < sudoku[i].length; j++) {
				for (int x = 0; x < 3; x++) {
					for (int y = 0; y < 3; y++) {
						if (sudoku[i][j] < sudoku[x][y]) {
							t = sudoku[i][j];
							sudoku[i][j] = sudoku[x][y];
							sudoku[x][y] = t;
						}
					}
				}
			}
		}
	}

	public boolean iguales(int[][] sudoku) {
		boolean repetido = false;
		for (int i = 0; i < sudoku.length; i++) {//
			for (int j = 0; j < sudoku[i].length; j++) {
				for (int x = (i); x < 3; x++) {
					for (int y = (j + 1); y < 3; y++) {
						if ((sudoku[i][j]) >= (sudoku[x][y])) {
							repetido = true;
						}

					}

				}
			}
		}
		return repetido;
	}
}

public class E4U4Sudoku {

	public static void main(String[] args) {

		Scanner teclado = new Scanner(System.in);
		int sudoku[][] = new int[3][3];
		boolean repe;
		for (int i = 0; i < sudoku.length; i++) {
			for (int j = 0; j < sudoku.length; j++) {
				System.out.print("Introduzca los numeros (" + i + "," + j + "): ");
				sudoku[i][j] = teclado.nextInt();
			}
		}

		// método java de ordenación por selección
		Ordena orden = new Ordena();
		orden.ordena(sudoku);

		// método para buscar iguales
		Ordena compara = new Ordena();
		repe = compara.iguales(sudoku);
		if (repe == true) {
			System.out.println("Hay repetidos");
		} else {
			System.out.println("NO hay repetidos");
		}

	}

}
