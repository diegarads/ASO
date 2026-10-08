#!/bin/bash

fichero="/etc/login.defs"
if [ ! -z "$1" ]; then
    fichero="$1"
fi

if [ ! -f "$fichero" ]; then
    echo "Error: El fichero no existe."
    exit 1
fi

grep -v '^#' "$fichero" | grep -v '^$'

totales=$(wc -l < "$fichero")
utiles=$(grep -v '^#' "$fichero" | grep -v '^$' | wc -l)

echo "Líneas totales: $totales"
echo "Líneas útiles: $utiles"

# PASS_MAX_DAYS es el tiempo máximo en días que una contraseña es válida antes de que el sistema te obligue a cambiarla.
# El valor 99999 equivale a casi 274 años, lo que significa que practicamente la contraseña no va a caducar nunca. 
# No es seguro. Para que fuera seguro deberiamos configurar un tiempo muy inferior para que el sistema pida renovar la contraseña periodicamente.
