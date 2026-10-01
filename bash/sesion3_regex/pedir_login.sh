#!/bin/bash

usuario_valido=0

re='^[a-z][a-z0-9]*$'

while [ $usuario_valido -eq 0 ]; do
    read -p "Introduce un nombre de usuario: " username

    if [[ $username =~ $re ]]; then
        if id "$username" &>/dev/null; then
            echo "El usuario '$username' ya existe en el sistema."
        else
            echo "El usuario '$username' es válido y no existe."
            echo "Para crearlo, ejecuta: sudo useradd $username"
        fi
        usuario_valido=1
    else
        echo "Nombre de usuario inválido. Debe empezar con una letra minúscula y contener solo letras minúsculas o dígitos."
    fi
done