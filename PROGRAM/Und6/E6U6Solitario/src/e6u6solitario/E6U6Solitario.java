package e6u6solitario;

import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.Scanner;


public class E6U6Solitario {

	final static int barajacompleta = 10;
	
	//método para comprabar si un número es entero
	 private static boolean isNumber(String s) {
	        try {
	            Integer.parseInt(s);
	            return true;
	        } catch (NumberFormatException e) {
	            return false;
	        }
	    }
	 
	public static void main(String[] args) {

		Scanner scanner = new Scanner(System.in);
		ArrayList<Integer> baraja = new ArrayList<>();
		ArrayDeque<Integer> pilaNueva = new ArrayDeque<>();
		

	// INICIO - COMPLETAR LA BARAJA Y APILARLA.
        boolean valido;
        
        do {
            valido = true;
            System.out.print("Introduzca números del 1 al "+ barajacompleta +" separados por espacios: ");
            String[] numeros = scanner.nextLine().split(" ");
            if (numeros.length != barajacompleta) {
                System.out.println("Debe introducir 10 números");
                valido = false;
            } else {
                for (String elemento : numeros) {
                    if (isNumber(elemento)) { //comprobamos si es un número.
                        int num = Integer.parseInt(elemento); 
                        if (num > 0 && num <= barajacompleta) { //comprobamos si está en el rango.
                            if (!baraja.contains(num)) { //revisamos que no este repetido.
                                baraja.add(num);
                            } else {
                                System.out.println("Número repetido.");
                                valido = false;
                            }
                        } else {
                            System.out.println("Número no válido.");
                            valido = false;
                        }
                    } else {
                        System.out.println("Caracter extraño.");
                        valido = false;
                    }
                    if (!valido) { //Si los datos no son válidos vacia la baraja.
                        baraja.clear();
                    }
                }
            }
        } while (!valido); //Mientras valido sea falso, repite el bucle. 
        scanner.close();

    
        /*
         * Esta parta la he creado asi, pero pienso que el problema está mal planteado,
         * si el usuario me introduce 10 números en una pila, lo lógico sería
         * que se apilaran en orden inverso, pero viendo los ejemplos, veo que se apilan
         * en el mismo orden que se introducen,tomando como primer elemento el priemero
         * escrito. De esta forma me obliga a introducir los números en una lista para
         * luego incluirlos en una pila en el mismo orden.
         */
        ArrayDeque<Integer> pila = new ArrayDeque<>(baraja);
	
     // PROCESO - PARTE EN QUE SE JUEGA
      //He decidido definir las variables antes de la parte donde se usan.
        int contador = 0; 
		boolean pilarecargada = false;
		boolean cartacolocada = true;
        
        do {

			// Recarga la pila si está vacia.
			if (pila.isEmpty() && (!pilaNueva.isEmpty())) {
				for (Integer elemento : pilaNueva) {
					pila.offerFirst(pilaNueva.poll());
					pilarecargada = true;
					// escontador = contador;
				}
			}

			// Saca la primera carta y la pone en pilaNueva
			if (!pila.isEmpty()) {
				pilaNueva.offerFirst(pila.poll());
			}
			// Saca la segunda carta y la pone en pilaNueva
			if (!pila.isEmpty()) {
				pilaNueva.offerFirst(pila.poll());
				cartacolocada = true;
			}

			// Mira carta de PilaNueva
			while (cartacolocada) {
				cartacolocada = false;
				if (!pilaNueva.isEmpty()) {
					if (pilaNueva.peekFirst() == (contador + 1)) { // Comprueba si la puede poner
						pilaNueva.poll();
						contador++;
						pilarecargada = false;
						cartacolocada = true;
					}
				}
			}
		} while (contador != 10 && !pilarecargada);
		// Repite mientas contador no sea 10 o haya recargado la pila sin poner ninguna

	// SALIDA - SI CONSIGUE SALVAR LAS 10 CARTAS O NO.
		if (contador == 10) {
			System.out.println("GANA");

		} else {
			System.out.println("PIERDE");
		}

	}
}
