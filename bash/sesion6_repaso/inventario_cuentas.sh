#!/bin/bash

regex='^(/[a-z]+)+$'

if [ $# -eq 0 ]; then
    shell_introducida="/bin/bash"
else
    shell_introducida="$1"
fi

if [[ ! $shell_introducida =~ $regex ]]; then
    echo "Error: $shell_introducida no es una ruta válida"
    exit 1
fi

total_cuentas=0
cuentas_mas_1000=0

while IFS=':' read -r usuario password uid gid descripcion home user_shell; do
    if [[ $user_shell == "$shell_introducida" ]]; then
        echo "${usuario}:${uid}:${home}:${user_shell}"

        ((total_cuentas++))

        if [[ $uid -ge 1000 ]]; then
            ((cuentas_mas_1000++))
        fi
    fi
done < /etc/passwd

echo "Total de cuentas: $total_cuentas"
echo "Hay cuentas ", $cuentas_mas_1000 "con UID mayor o igual a 1000"
