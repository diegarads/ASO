#!/bin/bash

mostrarMenu() {

    echo "===== GESTIÓN DE PROCESOS ====="
    echo "1) Listar los procesos de un usuario"
    echo "2) Buscar un proceso por nombre"
    echo "3) Mostrar los N procesos que más CPU consumen"
    echo "4) Cambiar la prioridad de un proceso"
    echo "5) Finalizar un proceso"
    echo "6) Salir"

}

listar_usuario() {
    read -p "Introduce el usuario: " usuario
    if id "$usuario" > /dev/null 2>&1; then
        ps -u "$usuario"
    else
        echo "El usuario no existe."
    fi
}

buscar_proceso() {
    read -p "Introduce el nombre del proceso: " nombre
    if ps aux | grep "$nombre" | grep -v "grep"; then
        echo ""
    else
        echo "El proceso $nombre no esta activo o no existe."
    fi
}

top_cpu() {
    ps aux --sort=-%cpu | head -n 6
}

cambiar_prioridad() {
    read -p "Introduce el PID: " pid

    if ! ps -p "$pid" > /dev/null 2>&1; then
        echo "El PID no existe."
        return
    fi

    read -p "Introduce el nuevo valor nice: " nice_val

    if [ $EUID -eq 0 ]; then
        if [ $nice_val -lt -20 ]; then
            echo "Error: el valor debe estar entre -20 y 19"
            return
        fi
        if [ $nice_val -gt 19 ]; then
            echo "Error: el valor debe estar entre -20 y 19"
            return
        fi
    else
        if [ $nice_val -lt 0 ]; then
            echo "Error: el valor debe estar entre 0 y 19"
            return
        fi
        if [ $nice_val -gt 19 ]; then
            echo "Error: el valor debe estar entre 0 y 19"
            return
        fi
    fi

    renice "$nice_val" "$pid"
}

finalizar_proceso() {
    read -p "Introduce el PID: " pid

    read -p "¿Quieres finalizar el proceso $pid? (s/n): " conf

    if [ "$conf" = "s" ]; then
        kill -SIGTERM "$pid"
        
        sleep 3

        if ps -p "$pid" > /dev/null 2>&1; then
            kill -SIGKILL "$pid"
        fi
    fi
}

opcion=0

while [[ $opcion -ne 6 ]]; do

        mostrarMenu
        
            read -p "Introduce una opcion: " opcion; 
        
        case $opcion in

        1) listar_usuario ;;
        2) buscar_proceso ;;
        3) top_cpu ;;
        4) cambiar_prioridad ;;
        5) finalizar_proceso ;;
        6) opcion=6 ;;
        *) echo "ERROR: Opcion no valida." 
           opcion=6 ;;

        esac
done
