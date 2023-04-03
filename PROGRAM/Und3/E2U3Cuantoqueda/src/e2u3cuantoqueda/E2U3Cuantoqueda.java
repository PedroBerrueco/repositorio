package e2u3cuantoqueda;

import java.util.Arrays;
import java.util.Scanner;

public class E2U3Cuantoqueda {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		Scanner in = new Scanner(System.in);
		// En este Array almacenaremos los km de cada etapa.
		int totalkm[] = new int[5];
		// En este array almacenaremos los km restantes tras cada etapa
		int[] restokm = new int[totalkm.length];
		// variable que almacena el total de km.
		int suma = 0;

		for (int i = 0; i < totalkm.length; i++) {
			System.out.print("Escribe el número de km de la etapa " + (i + 1) + " para continuar: ");
			totalkm[i] = in.nextInt();
			suma += totalkm[i];
		}

		for (int i = 0; i < totalkm.length; i++) {
				restokm[i] = suma;
				suma -= totalkm[i];
		}
		// Imprimir un vector
		System.out.println(Arrays.toString(restokm));
	}
}