#!/bin/bash

strval1="Ubuntu"
strval2="Windows"

#Chequeamos que los contenidos de las variables sea iguales
if [ $strval1 == $strval2 ]; then
  echo "Cadenas son iguales"
else
  echo "Cadenas no son iguales"
fi

#Comparación de variable y cadena
if [ $strval1 == "Ubuntu" ]; then
  echo "Linux es el Sistema operativo"
else
  echo "Windows es el sistema operativo"
fi


#!/bin/bash
string1='velero'
if [[ $string1 = *e* ]];
then
  echo Entra por aquí con expresión ….
else
 echo No entra por aquí …..
fi
