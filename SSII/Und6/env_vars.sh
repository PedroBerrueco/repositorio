#!/bin/bash
echo "Directorios de la variable 'PATH': $PATH"

cd
echo "Accediendo al directorio: $( pwd ) ..."
# como $? obtenemos el resultado de la ejecución del comando cd  ( 0 --> Ok   1--> ERROR)
echo "   Status = $?"

echo "Accediendo al directorio: /root ..."
cd /root
echo "   Status = $?"    # Error porque no podemos acceder

echo "Este script tiene el PID: $$"
echo "Este script ha sido ejecutado por: $USER"
echo "Este script se ejecuta en el host: $HOSTNAME"

sleep 2 
echo "Este script lleva durmiendo ${SECONDS} segundos"

# La variable RANDOM genera un número pseudo-aleatorio entre 0 y 32767.
echo "Un número aleatorio: ${RANDOM}"
echo "Otro número aleatorio: ${RANDOM}"
echo "Y otro número aleatorio más: ${RANDOM}"
# La siguiente deberia ser la línea 25
echo "Esta es la línea $LINENO del script."

cadena1='La unión hace '
cadena2='la fuerza'
cadena3=$cadena1$cadena2
echo "$cadena3"
