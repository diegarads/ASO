#!/bin/bash

if [ -n "$1" ]; then
    limite=$1

    if ! [[ "$limite" =~ ^[0-9]+$ ]]; then
        echo "Error: $limite no es un numero valido"
        exit 1
    fi

    if [ "$limite" -le 0 ]; then
        echo "Error: el numero tiene que ser mayor que 0"
        exit 1
    fi
fi

ps -u "$USER" -o pid,pcpu,pmem,comm --sort=-pcpu > procesos.txt

if [ -n "$limite" ]; then
    head -n $((limite + 1)) procesos.txt
else
    cat procesos.txt
fi

total=$(wc -l < procesos.txt)
total=$((total - 1))

echo "Procesos de $USER: $total"