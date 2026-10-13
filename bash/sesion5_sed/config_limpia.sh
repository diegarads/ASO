#!/bin/bash

if [ $# -eq 0 ]; then
    echo "No has introducido ninguna ruta."
    exit 1
elif [ -f $1 ]; then 
    sed -E '/^#|^$/d' $1
else
    echo "El archivo no existe."
fi