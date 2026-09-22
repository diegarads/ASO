#!/bin/bash

mostrar_uso_disco() {
    df -h --output=source,pcent \
    | grep -v "Use%"
}
