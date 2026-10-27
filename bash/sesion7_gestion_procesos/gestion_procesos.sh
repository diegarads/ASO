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
