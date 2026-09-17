#!/bin/bash

for entrada in prueba_bash/* ; do

    if [[ -e "$entrada" ]]; then 
        nombre=$(basename "$entrada")
            
        if [[ -f "$entrada" ]]; then
            echo "$nombre archivo"
        elif [[ -d "$entrada" ]]; then
            echo "$nombre directorio"
        fi

    else
        echo "El directorio esta vacio."
    fi
done
