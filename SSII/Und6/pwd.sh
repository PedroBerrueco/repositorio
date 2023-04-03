#!/bin/bash

CURR_DIR=$( pwd )

echo "El directorio actual es: ${CURR_DIR}"

 

# En este caso los espacios no importan

CURR_DIR=$( pwd)

CURR_DIR=$(pwd  )	 

echo "El directorio sigue siendo: ${CURR_DIR}"


# Con cmillas dobles
CURR_DIR="$( pwd )"
echo "La longitud del directorio sigue siendo: ${#CURR_DIR}"
