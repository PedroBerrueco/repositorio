#!/bin/bash

# Descomprimir archivos
mkdir temp
tar -xzf scripts.tar.gz -C temp/

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
            temp/ejercicio1.sh
            ;;
        2)
            temp/ejercicio2.sh
            ;;
        3)
            echo "Introduzca el primer número a sumar:"
            read parametro1
            echo "Introduzca el segundo número a sumar:"
            read parametro2
            temp/ejercicio3.sh "$parametro1" "$parametro2"
            ;;
        4)
            temp/ejercicio4.sh
            ;;
        5)
            echo "Escriba el nombre del fichero:"
            read parametro
            temp/ejercicio5.sh "$parametro"
            ;;
        6)
            temp/ejercicio6.sh
            ;;
        7)
            echo "Introduzca c para fecha en formato corta y l para fecha en formato larga:"
            read parametro
            temp/ejercicio7.sh "$parametro"
            ;;
        8)
            xdg-open temp/UD6.pdf
            ;;
        9)
            # Borrar archivos descomprimidos
            rm -rf temp
            exit 0
            ;;
        *)
            echo "Opción inválida."
            ;;
    esac
done
