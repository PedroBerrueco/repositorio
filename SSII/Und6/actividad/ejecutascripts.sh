#!/bin/bash

while true; do
    echo "Seleccione una opción:"
    echo "1. Ejercicio 1"
    echo "2. Ejercicio 2"
    echo "3. Ejercicio 3"
    echo "4. Ejercicio 4"
    echo "5. Ejercicio 5"
    echo "6. Ejercicio 6"
    echo "7. Ejercicio 7"
    echo "8. Revisar UD6.pdf"
    echo "9. Salir"
    read opcion

    case $opcion in
        1)
            ./ejercicio1.sh
            ;;
        2)
            ./ejercicio2.sh
            ;;
        3)
            echo "Introduzca el primer número a sumar:"
            read parametro1
            echo "Introduzca el segundo número a sumar:"
            read parametro2
            ./ejercicio3.sh "$parametro1" "$parametro2"
            ;;
        4)
            ./ejercicio4.sh
            ;;
        5)
            echo "Escriba el nombre del fichero:"
            read parametro
            ./ejercicio5.sh "$parametro"
            ;;
        6)
            ./ejercicio6.sh
            ;;
        7)
            echo "Introduzca c para fecha en formato corta y l para fecha en formato larga:"
            read parametro
            ./ejercicio7.sh "$parametro"
            ;;
        8)
            xdg-open UD6.pdf
            ;;
        9)
            exit 0
            ;;
        *)
            echo "Opción inválida."
            ;;
    esac
done
