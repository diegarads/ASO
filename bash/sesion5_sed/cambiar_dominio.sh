#!/bin/bash

if [ $# -eq 0 ]; then
    echo "No has introducido ninguna ruta."
    exit 1
elif [ -f $1 ]; then 
    sed -E 's/@gmail.com$|@hotmail.com$/@alu.edu.gva.es/' $1
else
    echo "El archivo no existe."
fi