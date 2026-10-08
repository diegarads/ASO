#!/bin/bash

if [ -z "$1" ]; then
    echo "No has introducido ningun correo."
    exit 1
fi

if [[ "$1" =~ ^[a-z0-9._-]+@(alu\.)?edu\.gva\.es$ ]]; then
    if [[ "$1" =~ @alu\.edu\.gva\.es$ ]]; then
        echo "$1 es una cuenta de alumnado"
    else
        echo "$1 es una cuenta de profesorado"
    fi
else
    echo "$1 no es una cuenta educativa"
fi