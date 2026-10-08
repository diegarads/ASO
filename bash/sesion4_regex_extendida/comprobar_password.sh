#!/bin/bash

if [ -z "$1" ]; then
    echo "No has introducido ninguna contraseña. Introduce un parametro."
    echo "NOTA: Si la contraseña contiene símbolos, hay que escribirla entre comillas simples al ejecutar el script. Si no, la shell puede interpretar algunos de ellos."
    exit 1
fi

pass="$1"
es_segura=1

if [[ "$pass" =~ .{12,} ]]; then
    echo " Tiene al menos 12 caracteres: sí"
else
    echo " Tiene al menos 12 caracteres: no"
    es_segura=0
fi

if [[ "$pass" =~ [0-9] ]]; then
    echo " Contiene algún dígito: sí"
else
    echo " Contiene algún dígito: no"
    es_segura=0
fi

if [[ "$pass" =~ [A-Z] ]]; then
    echo " Contiene alguna mayúscula: sí"
else
    echo " Contiene alguna mayúscula: no"
    es_segura=0
fi

if [[ "$pass" =~ [^a-zA-Z0-9] ]]; then
    echo " Contiene algún símbolo: sí"
else
    echo " Contiene algún símbolo: no"
    es_segura=0
fi

if [ -f /usr/share/dict/spanish ] && grep -q -i -x "$pass" /usr/share/dict/spanish; then
    echo " No es una palabra del diccionario: no"
    es_segura=0
else
    echo " No es una palabra del diccionario: sí"
fi

if [ $es_segura -eq 1 ]; then
    echo "La contraseña es segura"
else
    echo "La contraseña no es segura"
fi


# No me parece muy segura ya que utiliza el nombre del centro ademas del año actual y una exclamación al final.
# Es un perfil de contraseña bastante comun por lo que un ataque de fuerza bruta no tardaria mucho en vulnerarla.