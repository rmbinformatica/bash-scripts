#!/bin/bash
# (C) 2020 RMB Informatica - www.rmbinformatica.com
# Engenheiro responsavel: RENATO MONTEIRO BATISTA
#
# Este script realiza a limpeza das mensagens da pasta de Junk mail dos usuários de um dominio
# em um servidor cPanel que tenham mais de 90 dias.
#
# Para maiores informações acesse https://github.com/rmbinformatica/bash-scripts
#
find ~/mail/*/*/,Junk/cur -type f -mtime +90 -maxdepth 1 -exec rm -fv {} \;
