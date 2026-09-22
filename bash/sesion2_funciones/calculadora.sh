#!/bin/bash

funcion_suma() {
    read -p "Introduce el primer número: " num1
    read -p "Introduce el segundo número: " num2

    suma=$((num1 + num2))
    echo "La suma de los números introducidos es igual a: $suma"
}

funcion_resta() {
    read -p "Introduce el primer número: " num1
    read -p "Introduce el segundo número: " num2

    resta=$((num1 - num2))
    echo "La resta de los números introducidos es igual a: $resta"
}

funcion_multiplicacion() {
    read -p "Introduce el primer número: " num1
    read -p "Introduce el segundo número: " num2

    mult=$((num1 * num2))
    echo "La multiplicación de los números introducidos es igual a: $mult"
}

funcion_division() {
    read -p "Introduce el primer número: " num1
    read -p "Introduce el segundo número: " num2

        div=$((num1 / num2))
        echo "La división de los números introducidos es igual a: $div"
}


funcion_menu() {
    case $opcion in
        1)
            echo "Has seleccionado Sumar"
            funcion_suma
            ;;
        2)
            echo "Has seleccionado Restar"
            funcion_resta
            ;;
        3)
            echo "Has seleccionado Multiplicar"
            funcion_multiplicacion
            ;;
        4)
            echo "Has seleccionado Dividir"
            funcion_division
            ;;
        0)
            echo "Saliendo..."
            exit 0
            ;;
        *)
            echo "Opción inválida"
            ;;
    esac
}


while [ "$opcion" != "0" ]; do

clear

echo "%~~~~~~~~~~~~~~~~~~~~~~~~~%"
echo "|   MENU DE CALCULADORA   |"
echo "|~~~~~~~~~~~~~~~~~~~~~~~~~|"
echo "| 1. Sumar                |"
echo "| 2. Restar               |"
echo "| 3. Multiplicar          |"
echo "| 4. Dividir              |"
echo "| 0. Salir                |"
echo "%~~~~~~~~~~~~~~~~~~~~~~~~~%"
read -p "Seleccione una opción: " opcion

funcion_menu
read -p "Pulse una tecla para continuar..."

done