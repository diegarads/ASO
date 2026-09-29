#!/bin/bash

exp_conf='\.conf$'
exp_bak='\.(bak|~)$'
contador1=0
contador2=0

echo "Ficheros de configuración: "
echo "---------------------------"
for list in /etc/* ; do

    if [[ $list =~ $exp_conf ]];
        then 
            contador1=$((contador1 +1))
            echo $list
        elif [[ $list =~ $exp_bak ]];
            then
                contador2=$((contador2 +1))
                echo $list 
    fi

done

echo "------------------------------"
echo "Archivos de configuración: $contador1"
echo "Archivos de seguridad: $contador2"