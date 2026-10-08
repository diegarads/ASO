#!/bin/bash

if [ -z "$1" ]; then
    echo "Introduce una ip"
    exit 1
fi

if [[ "$1" =~ ^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$ ]]; then
    echo "$1 tiene formato de IP"
else
    echo "$1 no tiene formato de IP"
fi

# Con 999.999.999.999 el script dice que tiene formato de IP porque la expresión regular solo mira que haya 4 grupos de 1 a 3 números separados por puntos.
# No es una IP válida, porque los octetos de una IP real solo pueden ir del 0 al 255. 
