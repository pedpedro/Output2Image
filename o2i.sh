#!/bin/bash

for linha in $(cat 'lista');do
    echo $linha
#   mkdir $linha
#   cd $linha
    python3 simple-security-headers.py -u $linha >> $linha.ansi
    ansilove -o $linha.png $linha.ansi
#   cd ..
done
