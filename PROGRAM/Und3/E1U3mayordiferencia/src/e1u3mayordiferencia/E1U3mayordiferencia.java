package e1u3mayordiferencia;

//import java.text.DecimalFormat;
import java.util.Scanner;

class MiClase {
	// Atributos de la clase

	public int metodo() {
		Scanner sc = new Scanner(System.in);
		 int ArrNotas[] = new int[5];
		 int numalum = 1;
		 int menor = Integer.MAX_VALUE;
		 int mayor = Integer.MIN_VALUE;
		 int resultado = 0;
		
		 for (int i : ArrNotas) {

			System.out.print("Introduce la nota del alumno " + numalum + ": ");
			ArrNotas[i] = sc.nextInt();
			numalum++;
			
			if (ArrNotas[i] > mayor) {
				mayor = ArrNotas[i];
			}
			if (ArrNotas[i] < menor) {
				menor = ArrNotas[i];
			}
		}
		resultado = (mayor-menor);
		return resultado;
	}
}

public class E1U3mayordiferencia {

	//INICIO
	public static void main(String[] args) {
	
		//DecimalFormat nota1 new DecimalFormat("#.0");
		MiClase llamada = new MiClase();
		System.out.println("La mayor diferencia entre notas es: " + llamada.metodo());
	}
}
