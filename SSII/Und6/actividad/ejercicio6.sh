#!/bin/bash

for ((num=1; num<=100; num++))
do
    # Si el número es menor o igual a 1, no es primo
    if [[ $num -le 1 ]]
    then
        echo "$num no es primo"
    else
        # Verificar si el número es primo
        primo=true
        for ((i=2; i<num; i++))
        do
            if [[ $((num%i)) -eq 0 ]]
            then
                primo=false
                break
            fi
        done
        
        # Imprimir el resultado
        if [[ $primo == true ]]
        then
            echo "$num es primo"
        else
            echo "$num no es primo"
        fi
    fi
done
