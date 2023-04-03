package e3u3piezaperdida;

import java.util.Arrays;
import java.util.Scanner;

public class E3U3PiezaPerdida {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		Scanner sc = new Scanner(System.in);
		int piezas[] = new int[4];
		int faltante[] = new int [5];
		
	/*	
		boolean v1 = false;
		boolean v2 = false;
		boolean v3 = false;
		boolean v4 = false;
		boolean v5 = false;
	 */
		

		for (int i = 0; i < piezas.length; i++) {
			System.out.print("¿Qué número de pieza tienes? ");
			piezas[i] = sc.nextInt();
		}
		
		
		for (int i = 0; i < piezas.length; i++) {
			faltante [piezas[i] -1] = 1;
			
		}	
		
		for (int i = 0; i < faltante.length; i++) {
			if (faltante[i] == 0)
				System.out.println("Te falta la pieza " + (i +1));
			
		}
		

/*
 		for (int i = 0; i < piezas.length; i++)  {
 
			if (piezas[i] == 1) {
				v1 = true;
			}
			if (piezas[i] == 2) {
				v2 = true;
			}
			if (piezas[i] == 3) {
				v3 = true;
			}
			if (piezas[i] == 4) {
				v4 = true;
			}
			if (piezas[i] == 5) {
				v5 = true;
			}
		}
		
		if (v1 == false) {
			System.out.println("Te falta la pieza 1");
		}
		if (v2 == false) {
			System.out.println("Te falta la pieza 2");
		}
		if (v3 == false) {
			System.out.println("Te falta la pieza 3");
		}
		if (v4 == false) {
			System.out.println("Te falta la pieza 4");
		}
		if (v5 == false) {
			System.out.println("Te falta la pieza 5");
		}
		
		
*/		
	}
}
