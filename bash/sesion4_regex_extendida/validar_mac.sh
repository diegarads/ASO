#!/bin/bash

if [ -z "$1" ]; then
    echo "Introduce una MAC"
    exit 1
fi

if [[ "$1" =~ ^([0-9a-fA-F]{2}[:\-]){5}[0-9a-fA-F]{2}$ ]]; then
    echo "$1 es una MAC válida"
else
    echo "$1 no es una MAC válida"
fi