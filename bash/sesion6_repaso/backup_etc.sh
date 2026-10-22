#!/bin/bash

dir_copias="/var/backups"
num_copias="7"
max_copias_re="^[0-9]+$"

# Funcion de registro
registrar() {
    mensaje="$1"
    hora_actual=$(date +%H:%M:%S)

    echo "$hora_actual $mensaje"
    logger -t aso-backup "$mensaje"
}

# Comprobar directorio
if [[ -n "$1" ]]; then
    if [[ ! -d "$1" ]]; then
        echo "Error: '$1' no es un directorio válido."
        exit 1
    fi
    dir_copias="$1"
fi

# Comprobar copias
if [[ -n "$2" ]]; then
    if [[ ! "$2" =~ $max_copias_re ]]; then
        echo "Error: '$2' no es un número."
        exit 1
    elif [[ "$2" -le 0 ]]; then
        echo "Error: el número debe ser mayor que 0."
        exit 1
    fi
    num_copias="$2"
fi

# Copia comprimida
fecha_hora=$(date +%Y%m%d-%H%M%S)
nombre_archivo="etc-$fecha_hora.tar.gz"
ruta_completa="$dir_copias/$nombre_archivo"

tar -czf "$ruta_completa" /etc &>/dev/null

# Registrar creación
registrar "Copia creada: $ruta_completa"

# Contar copias existentes en el destino
total_copias=$(ls "$dir_copias" | grep -E '^etc-[0-9]{8}-[0-9]{6}\.tar\.gz$' | wc -l)

# Comprobar si superamos el máximo recomendado
if [[ "$total_copias" -gt "$num_copias" ]]; then
    registrar "Aviso: hay $total_copias copias y el máximo recomendado es $num_copias"
fi