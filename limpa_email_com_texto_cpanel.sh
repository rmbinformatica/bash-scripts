#!/bin/bash
# Script para limpar e-mails da caixa de entrada que possuem um trecho especifico de texto e move-las para a pasta de spam (Junk)
# Uso: limpa_email_com_texto_cpanel.sh <dominio> <texto>
cd ~/mail/$1
for i in * 
do
    if [ -d "$i" ]; then
       echo "Acessando diretorio $i"
       echo cd ~/mail/$1/$i/cur/
       cd ~/mail/$1/$i/cur/
       grep -l "$2" * | xargs -I {} mv {} ../.Junk/cur/
       cd ~/mail/$1
    fi
done
