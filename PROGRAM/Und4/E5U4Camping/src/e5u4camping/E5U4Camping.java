package e5u4camping;

import java.util.Scanner;


public class E5U4Camping {

		public static void main(String[] args) {

			int[][] camping = new int[10][10];
			int[][] copiacamp = new int[10][10];
			int contador; 

			//solicitamos al usuario las coordenadas de los 4 arboles
			camping = Operaciones.pidearbol(camping); 
			
			//Ponemos las sombras alrededor de los arboles
			copiacamp = Operaciones.dibujasombra(camping);
			
			
			System.out.println("Matriz original");
			// For para que imprima la matriz de campins
			for (int x = 0; x < camping.length; x++) {
				System.out.println("");
				for (int y = 0; y < camping[x].length; y++) {
					System.out.print(camping[x][y] + " ");
				}
			} System.out.println("");
			
			System.out.println("Matriz copiada y modificada");
			
			for (int x = 0; x < copiacamp.length; x++) {
				System.out.println("");
				for (int y = 0; y < copiacamp[x].length; y++) {
					System.out.print(copiacamp[x][y] + " ");
				}
			}
			//contamos las parcelas en sombra
			contador = Operaciones.cuentasombra(copiacamp);
			
			System.out.println("La sombra total es: " + contador );
		}
		

	}
