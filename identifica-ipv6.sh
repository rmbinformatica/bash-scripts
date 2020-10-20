#!/bin/bash
# (C) 2020 RMB Informatica - www.rmbinformatica.com
# Engenheiro responsavel: RENATO MONTEIRO BATISTA
#
# Identifica o IPv6 do computador.
#
# Para maiores informações acesse https://github.com/rmbinformatica/bash-scripts
#
ip addr show $(ip -6 route show | awk '/^default/ {print $5}') | awk '/inet6 .* scope global/ {print $2}'