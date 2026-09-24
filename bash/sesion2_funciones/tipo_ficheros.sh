#!/bin/bash

contar_por_extension(){
    read -p "Introduce el nombre de la carpeta y su extension:" carpeta extension
    numero_ficheros=$(find "$carpeta" -maxdepth 1 -type f -name "*.$extension" | wc -l)

    echo "En $carpeta hay $numero_ficheros ficheros de extension .$extension"
}

contar_por_extension