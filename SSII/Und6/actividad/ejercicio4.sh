#!/bin/bash

while true
do
    # Mostramos el menú de selección de operación
    echo "Seleccione una operación:"
    echo "1 ) Potenciación:"
    echo "2 ) Conversión de grados centígrados a fahrenheit:"
    echo ""

    # Leemos la opción del usuario
    read opcion

    # Evaluamos la opción seleccionada por el usuario
    case $opcion in
        1)
            # Pedimos la base y el exponente al usuario
            echo "Introduce la base:"
            read base

            echo "Introduce el exponente:"
            read exponente

            # Comprobamos si los parámetros son numéricos
            if [[ ! "$base" =~ ^[0-9]+$ || ! "$exponente" =~ ^[0-9]+$ ]]; then
                echo "Error: los parámetros deben ser numéricos"
                echo ""
		continue
            fi

            # Realizamos la operación de potenciación con un bucle for
            resultado=1
            for ((i=1; i<=exponente; i++))
            do
                resultado=$((resultado * base))
            done

            echo "$base elevado a $exponente es igual a $resultado"
            echo ""
	    ;;
        2)
            # Pedimos los grados centígrados al usuario
            echo "Introduce los grados centígrados:"
            read temperatura

            # Comprobamos si el parámetro es numérico
            if [[ ! "$temperatura" =~ ^[0-9]+$ ]]; then
                echo "Error: el parámetro debe ser numérico"
                echo ""
		continue
            fi

            # Realizamos la conversión a fahrenheit
            fahrenheit=$((18 * temperatura / 10 + 32))

            echo "$temperatura grados centígrados son $fahrenheit grados fahrenheit"
            echo ""
	    ;;
        *)
            echo "Error: opción no válida"
	    echo ""
            ;;
    esac
done

