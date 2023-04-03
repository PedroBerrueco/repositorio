package e8u3sumasiguales;

import java.util.Arrays;
import java.util.Scanner;

public class E8U3SumasIguales {

	public static void main(String[] args) {

		Scanner sc = new Scanner(System.in);

		int array[] = new int[5];
		int invertido[] = new int[5];
		int suma = 0;
		int sumainv = 0;
		boolean esigual = false;

		// Pedimos al usuario los valores del array.
		for (int i = 0; i < array.length; i++) {
			System.out.print("Cantidad " + (i + 1) + ": ");
			array[i] = sc.nextInt();
		}
		//For para invertir los números del array anterior
		for (int i = 0; i < invertido.length; i++) {
			// el valor de cada posicion de invertido será igual al valor del array original en la `psición de su largo menos uno y menos el indice actual.
			invertido[i] = array[(array.length - 1) - i];
		}

		//Un for para sumar los números que vamos tomando desde el principio. 
		for (int i = 0; i < array.length; i++) {
			suma += array[i];
			sumainv = 0;
			//Un for para sumar los números que vamos tomando desde el final hasta el largo del array invertido menos uno menos el indice del for anterior.
			for (int j = 0; j < (invertido.length -1) - i; j++) {
				sumainv += invertido[j];
				//Si encontramos alguna suma igual entre lo que tenemos y lo que queda ponemos el booleano a true.
				if (suma == sumainv) {
					esigual = true;
				
			}
			
			}
		}
		//imprimimos si o no según el valor del booleano.
		if (esigual == true) {
			System.out.println("SÍ");
		} else {
			System.out.println("NO");
		}
	}
}