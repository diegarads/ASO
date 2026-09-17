#!/bin/bash

servicio=$1

if [ -n "$servicio" ]; then
    echo "Iniciando el servicio $servicio..."
else
    echo "Debes indicar el nombre del servicio"
fi