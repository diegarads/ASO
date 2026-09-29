#!/bin/bash

pedir_puerto_valido() {
  while true; do
    read -p "Introduce un puerto TCP (1-65535): " puerto
    [[ \(puerto =~ ^[0-9]+\) ]] && (( puerto >= 1 && puerto <= 65535 )) && break
  done
}

pedir_puerto_valido

echo "El puerto introducido es: $puerto"