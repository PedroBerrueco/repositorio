package e2u6teclado;

import java.util.LinkedList;
import java.util.ListIterator;
import java.util.Scanner;

public class E2U6Teclado {

	public static void main(String[] args) {
	
	//INICIO
		Scanner sc = new Scanner(System.in);
		LinkedList <Character> Lista = new LinkedList<>();
		LinkedList <Character> Lista2 = new LinkedList<>();
		ListIterator<Character> li = Lista2.listIterator();
		String cadena;
		char caracter;
		
		System.out.println("Introduce una cadena: ");
		cadena = sc.next();
		sc.close();
		for (int i = 0; i < cadena.length(); i++) {
			caracter = cadena.charAt(i);
			Lista.add(caracter);
		}
		
	//PROCESO
	for (Character elemento : Lista) {
		if (elemento != '3' && elemento != '-' && elemento != '*' && elemento != '+') {
			li.add(elemento);
		}
		if (elemento == '3') {
			if(li.hasNext()) {
				li.next();
				li.remove();
			}
		}
		if (elemento == '-') {
			while(li.hasPrevious())
				li.previous();
		}
		if (elemento == '+') {
			while(li.hasNext())
				li.next();
		}
		if (elemento == '*') {
			if(li.hasNext()) {
				li.next();
			}
		}
	}
		
	//SALIDA	
		for (Character character : Lista2) {
			System.out.print(character);
			
		}
	}
}