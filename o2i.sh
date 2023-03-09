#!/bin/bash

if [[ $# -lt 1 ]]; then
    echo "Uso: $0 [headers|sslscan] (alvo|arquivo)"
    exit 1
fi

if [[ "$1" == "headers" ]]; then
    if [[ $# -lt 2 ]]; then
        echo "Uso: $0 headers (alvo|arquivo)"
        exit 1
    fi

    if [[ -f "$2" ]]; then
        while IFS= read -r linha; do
            echo "$linha"
            mkdir "$linha"
            cd "$linha"
            python3 simple-security-headers.py -u "$linha" >> "$linha.ansi"
            ansilove -o "$linha.png" "$linha.ansi"
            cd ..
        done < "$2"
    else
        alvo="$2"
        echo "$alvo"
        mkdir "$alvo"
        cd "$alvo"
        python3 simple-security-headers.py -u "$alvo" >> "$alvo.ansi"
        ansilove -o "$alvo.png" "$alvo.ansi"
        cd ..
    fi

elif [[ "$1" == "sslscan" ]]; then
    if [[ $# -lt 2 ]]; then
        echo "Uso: $0 sslscan (alvo|arquivo)"
        exit 1
    fi

    if [[ -f "$2" ]]; then
        while IFS= read -r linha; do
            echo "$linha"
            mkdir "$linha"
            cd "$linha"
            sslscan $linha >> "$linha.ansi"
            ansilove -o "$linha.png" "$linha.ansi"
            cd ..
        done < "$2"
    else
        alvo="$2"
        echo "$alvo"
        mkdir "$alvo"
        cd "$alvo"
        sslscan "$alvo" >> "$alvo.ansi"
        ansilove -o "$alvo.png" "$alvo.ansi"
        cd ..
    fi

else
    echo "Opção inválida: $1"
    echo "Uso: $0 [headers|sslscan] (alvo|arquivo)"
    exit 1
fi
