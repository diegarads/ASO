#!/bin/bash

nombre=$n

read -p "Introduce un nombre:" $n

if [ $n -nt 0 ]
	then
		echo "Hola", $n,"bienvenido/a"
	else
		echo "Debes indicar un nombre"
fi
