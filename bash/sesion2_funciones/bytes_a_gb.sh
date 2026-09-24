#!/bin/bash

bytes_a_gb() {
    read -p "Ingrese la cantidad de bytes: " bytes

    gigas=$(echo "scale=2; $bytes / 1073741824" | bc)

    echo "$bytes bytes son $gigas GB"
}

bytes_a_gb