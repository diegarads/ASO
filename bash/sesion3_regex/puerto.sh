#!/bin/bash

re='^[0-9][0-9]*$'

if [ $# -eq 0 ];
  then 
      echo "No se ha introducido ningun parametro."
      exit 1
fi

      if [[ $# =~ $re ]];
        then
          if [ $# -ge 1 ] && [ $# -le 65535 ];
            then
              echo $1 "Esta dentro del rango (1-65535)"
            else
              echo $1 "Está fuera del rango (1-65535)"
          fi
        else
          echo "No es un parametro valido"
      fi