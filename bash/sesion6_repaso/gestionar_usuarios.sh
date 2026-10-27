#!/bin/bash

if [ -z "$1" ]; then
    echo "Error: no has puesto ninguna accion"
    exit 1
fi

accion=$1

if [ "$accion" = "alta" ]; then
    read -p "Introduce el nombre: " nombre
    read -p "Introduce el primer apellido: " ap1
    read -p "Introduce el segundo apellido: " ap2

    if [ -z "$nombre" ]; then
        echo "Error: el nombre no puede quedarse en blanco"
        exit 1
    fi
    if [ -z "$ap1" ]; then
        echo "Error: falta el primer apellido"
        exit 1
    fi
    if [ -z "$ap2" ]; then
        echo "Error: falta el segundo apellido"
        exit 1
    fi

    l1=${nombre:0:2}
    l2=${ap1:0:2}
    l3=${ap2:0:1}

    usuario="alu$l1$l2$l3"

    if grep -q "^$usuario:" /etc/passwd; then
        echo "Error: el usuario $usuario ya existe."
        exit 1
    fi

    echo "Identificador generado: $usuario"
    echo "Comando para crear al usuario: sudo useradd -m -s /bin/bash -c \"$nombre $ap1 $ap2\" $usuario"

elif [ "$accion" = "baja" ]; then
    usuario=$2

    if [ -z "$usuario" ]; then
        echo "Error: falta el identificador del usuario"
        exit 1
    fi

    if ! grep -q "^$usuario:" /etc/passwd; then
        echo "Error: el usuario $usuario no exsiste."
        exit 1
    fi

    echo "Comando para borrar al usuario: sudo userdel -r $usuario"

else
    echo "Error: la accion '$accion' no es una accion valida"
    exit 1
fi