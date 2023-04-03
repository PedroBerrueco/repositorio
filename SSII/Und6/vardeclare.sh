#!/bin/bash

# declaro una variable de tipo entero
declare -i NUM=42
echo ">>> NUM = ${NUM}"

# Veamos que pasa si a una variable de tipo entero le asigno un string
NUM='tortilla'
echo ">>> NUM = ${NUM}"

# Muestra atributos y valores de la variable
declare -p NUM



readonly NUM2=82
echo ">>> NUM2 = ${NUM2}"

# Se produce un error
NUM2=56
echo ">>> NUM2 = ${NUM2}"
