#!/bin/bash

if [ $# -eq 0 ]; then
    echo "No has introducido ninguna ruta."
    exit 1
elif [ -f $1 ]; then 
    sed -E 's/[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}/X.X.X.X/g' > accesos.log.anonimo $1
else
    echo "El archivo no existe."
fi