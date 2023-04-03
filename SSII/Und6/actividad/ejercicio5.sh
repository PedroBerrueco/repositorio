#!/bin/bash

if [ $# -ne 1 ]; then
  echo "Error debe introducir un paramatro detras de $0"
  exit 1
fi

filename=$1

if [ -e "$filename" ]; then
  echo "El fichero $filename ya existe en el directorio actual"
else
  echo "El fichero $filename no existe en el directorio actual. Se creará y se introducirán 10 líneas con números del 1 al 10."
  for i in {1..10}; do
    echo $i >> $filename
  done
fi
