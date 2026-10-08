#!/bin/bash

if [ -z "$1" ]; then
    echo "Uso: $0 <direccion_ip>"
    exit 1
fi

if [[ "$1" =~ ^127\. ]]; then
    echo "$1 es una dirección loopback"
elif [[ "$1" =~ ^(10\.|192\.168\.|172\.(1[6-9]|2[0-9]|3[0-1])\.) ]]; then
    echo "$1 es una dirección privada"
else
    echo "$1 es una dirección pública"
fi

# Como del 16 al 31 no se puede poner todos en los mismos corchetes, lo dividí en tres partes usando tuberías (|) ya que funcionan como "o".
# Del 16 al 19 con 1[6-9], del 20 al 29 con 2[0-9], y del 30 y 31 con 3[0-1].