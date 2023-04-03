#!/bin/bash
# Se usa expansión: con dobles paréntesis que rodean a una expresión matemática
a=$((3+4))
echo "a = ${a}"

# Es buena práctica usar espacios para mejorar la claridad y la legibilidad
a=$(( 40 + 2 ))
echo "Ahora, a = ${a}"

# Se pueden usar variables como operandos de las expresiones matemáticas.
b=$(( $a - 10 ))
echo "b = ${b}"

# Se puede omitir el símbolo $:
b=$(( 10 + a + 10 ))
echo "Ahora, b = ${b}"

# Se puede usar ++ para incrementar en 1.  
(( b++ ))
echo "Autoincremento: b = ${b}"

# Como en otros lenguajes, se puede sumar y asignar en una sentencia
(( b += 5 ))
echo "Suma y asigna: b = ${b}"

# Operaciones comunes
a=$(( 5 + 7 ))
echo "5 + 7 = ${a}"

a=$(( 5 - 7 ))
echo "5 - 7 = ${a}"

a=$(( 5 * 7 ))
echo "5 * 7 = ${a}"

a=$(( 5 / 7 ))
echo "5 / 7 = ${a}"

a=$(( 7 / 5 ))
echo "7 / 5 = ${a}"

a=$(( 7 % 5 ))
echo "7 % 5 = ${a}"

a=$(( 5 ** 7 ))
echo "5 ** 7 = ${a}"
