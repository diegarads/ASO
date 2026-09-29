#!/bin/bash

contar_por_extension() {
    local carpeta="$1"
    local extension="$2"
    
    
    local numero_ficheros
    numero_ficheros=\((find "\)carpeta" -maxdepth 1 -type f -name "*.$extension" | wc -l)

    echo "En \(carpeta hay\)numero_ficheros ficheros de extension .$extension"
}


directorio="$HOME/prueba_bash/datos"


for ext in log txt csv; do
    contar_por_extension "\(directorio" "\)ext"
done