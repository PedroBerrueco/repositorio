package e5u4camping;

import java.util.Scanner;

public class Operaciones {
	
	public static int[][] pidearbol(int [][] camping){
		
		Scanner teclado = new Scanner(System.in);
		int fila = 0;
		int colu = 0;
		
		for (int i = 0; i < 4; i++) {
			System.out.print("Introduzca fila del árbol " + (i + 1) + ": ");
			fila = teclado.nextInt();
			System.out.print("Introduzca columna del arbol " + (i + 1) + ": ");
			colu = teclado.nextInt();
			camping[fila][colu] = 1;
			
			
		}
		return camping; 
		
	}

	public static int[][] dibujasombra(int[][] camping) {
		
		int[][] copiacamp = new int[10][10];

		for (int i = 0; i < camping.length; i++) {
			for (int j = 0; j < camping.length; j++) {
				if (camping[i][j] == 1) {
					if ((i > 0) && (i < 9) && ((j > 0) && (j < 9))) { // 1.Sin márgenes.
						copiacamp[i - 1][j - 1] = 1;
						copiacamp[i - 1][j] = 1;
						copiacamp[i - 1][j + 1] = 1;
						copiacamp[i][j - 1] = 1;
						copiacamp[i][j] = 1;
						copiacamp[i][j + 1] = 1;
						copiacamp[i + 1][j - 1] = 1;
						copiacamp[i + 1][j] = 1;
						copiacamp[i + 1][j + 1] = 1;
					}
					if ((i == 0) && (j == 0)) { // 2.Esquina superior izquierda.
						copiacamp[i][j] = 1;
						copiacamp[i][j + 1] = 1;
						copiacamp[i + 1][j] = 1;
						copiacamp[i + 1][j + 1] = 1;
					}
					if ((i == 0) && ((j > 0) && (j < 9))) { // 3.Primera fila sin esquinas
						copiacamp[i][j - 1] = 1;
						copiacamp[i][j] = 1;
						copiacamp[i][j + 1] = 1;
						copiacamp[i + 1][j - 1] = 1;
						copiacamp[i + 1][j] = 1;
						copiacamp[i + 1][j + 1] = 1;
					}
					if ((i == 0) && (j == 9)) { // 4.Esquina superior derecha.
						copiacamp[i][j - 1] = 1;
						copiacamp[i][j] = 1;
						copiacamp[i + 1][j - 1] = 1;
						copiacamp[i + 1][j] = 1;
					}
					if (((i > 0) && (i < 9)) && (j == 0)) { // 5.Primera columna sin esquinas
						copiacamp[i - 1][j] = 1;
						copiacamp[i - 1][j + 1] = 1;
						copiacamp[i][j] = 1;
						copiacamp[i][j + 1] = 1;
						copiacamp[i + 1][j] = 1;
						copiacamp[i + 1][j + 1] = 1;
					}
					if (((i > 0) && (i < 9)) && (j == 9)) { // 6.Última columna sin esquinas
						copiacamp[i - 1][j - 1] = 1;
						copiacamp[i - 1][j] = 1;
						copiacamp[i][j - 1] = 1;
						copiacamp[i][j] = 1;
						copiacamp[i + 1][j - 1] = 1;
						copiacamp[i + 1][j] = 1;
					}
					if ((i == 9) && (j == 0)) { // 7.Esquina inferior izquierda.
						copiacamp[i - 1][j] = 1;
						copiacamp[i - 1][j + 1] = 1;
						copiacamp[i][j] = 1;
						copiacamp[i][j + 1] = 1;
					}
					if ((i == 9) && ((j > 0) && (j < 9))) { // 8.Última fila sin esquinas
						copiacamp[i - 1][j - 1] = 1;
						copiacamp[i - 1][j] = 1;
						copiacamp[i - 1][j + 1] = 1;
						copiacamp[i][j - 1] = 1;
						copiacamp[i][j] = 1;
						copiacamp[i][j + 1] = 1;
					}
					if ((i == 9) && (j == 9)) { // 9.Esquina inferior derecha.
						copiacamp[i - 1][j - 1] = 1;
						copiacamp[i - 1][j] = 1;
						copiacamp[i][j - 1] = 1;
						copiacamp[i][j] = 1;
					}

				}

			}

		}
		return copiacamp;

	}
	public static int cuentasombra(int[][] copiacamp) {
		
		int contador = 0;
		
		for (int i = 0; i < copiacamp.length; i++) {
			for (int j = 0; j < copiacamp.length; j++) {
				if (copiacamp[i][j] == 1) {
					contador++;
				}
				
			}
		}
		
		
		return contador;
	}
}
