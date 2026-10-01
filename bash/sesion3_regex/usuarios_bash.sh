#!/bin/bash

#Escribe usuarios_bash.sh, que lee /etc/passwd línea a línea y muestra el nombre de los usuarios
#cuya línea termina en bash. Al final, muestra cuántos hay.

contador=0

while read linea; do
    if [[ $linea == *bash ]]; then
        echo "$linea"
        contador=$((contador + 1))
    fi
done < /etc/passwd
echo "Hay $contador usuarios que terminan bash."