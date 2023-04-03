#!/bin/bash

case $# in
  0)
    read -p "Ingrese el primer número: " num1
    read -p "Ingrese el segundo número: " num2
    ;;
  1)
    num1=$1
    read -p "Ingrese el segundo número: " num2
    ;;
  *)
    num1=$1
    num2=$2
    ;;
esac

suma=$(( num1 + num2 ))

echo "si sumamos $num1 + $num2 el resultado será $suma"
