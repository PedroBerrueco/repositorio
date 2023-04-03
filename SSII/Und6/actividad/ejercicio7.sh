#!/bin/bash

# Verificar si se ha proporcionado un parámetro
if [[ $# -ne 1 ]]
then
    # Mostrar calendario del mes actual
    cal
elif [[ $1 == "c" || $1 == "corta" ]]
then
    fecha=$(date +"%d/%m/%Y")
    echo "$fecha"
elif [[ $1 == "l" || $1 == "larga" ]]
then
    dia=$(date +"%d")
    mes=$(date +"%m")
    ano=$(date +"%Y")
    echo "Hoy es el día '$dia' del mes '$mes' del año '$ano'."
else
    echo "Opción incorrecta."
    exit 2
fi
