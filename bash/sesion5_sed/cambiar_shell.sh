#!/bin/bash

if [ $# -ne 2 ]; then
    echo "No has intrducido los parametros necesarios."
    exit 1
fi

usuario="$1"
shell="$2"

if ! grep -q "^${usuario}:" passwd; then
    echo "Error: el usuario ${usuario} no existe"
    exit 1
fi

if [[ "$shell" =~ ^/bin/(bash|sh|zsh)$ ]]; then
    cp passwd passwd.bak

    Antes=$(grep "^${usuario}:" passwd)

    sed -i -E "s|^(${usuario}:([^:]*:){5})[^:]*$|\1$shell|" passwd

    echo "$(grep "^${usuario}:" passwd)"
else
    echo "Error: la shell debe ser /bin/bash, /bin/sh o /bin/zsh"
    exit 1
fi