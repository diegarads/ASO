#!/bin/bash

regex='^[0-9]{1,3}$'

if [[ $# -eq 0 ]]; then
    echo "No has introducido ningun valor."
    exit 1
fi 

if [[ $1 =~ $regex ]]; then 
    cp login.defs login.defs.bak

    Antes=$(grep -E '^\s*PASS_MAX_DAYS' login.defs)
    
    sed -i -E "s/^(PASS_MAX_DAYS\s+)[0-9]+/\1$1/" login.defs

    echo "Antes: ${Antes}"
    echo "Despues: PASS_MAX__DAYS $1"
else
    echo "No es un numero de dias valido."
fi

