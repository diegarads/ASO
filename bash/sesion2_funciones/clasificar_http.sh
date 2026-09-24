#!/bin/bash

clasificar_http(){
    read -p "Introduce el código de estado HTTP: " codigo

    if [[ $codigo -ge 200 && $codigo -lt 300 ]]; then
        echo "Exito"
    elif [[ $codigo -ge 300 && $codigo -lt 400 ]]; then
        echo "Redirección"
    elif [[ $codigo -ge 400 && $codigo -lt 500 ]]; then
        echo "Error del cliente"
    elif [[ $codigo -ge 500 && $codigo -lt 600 ]]; then
        echo "Error del servidor"
    else
        echo "Código de estado HTTP no válido."
    fi
}

clasificar_http