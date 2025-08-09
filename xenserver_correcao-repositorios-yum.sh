#!/bin/bash
# (C) 2025 RMB Informatica - www.rmbinformatica.com
# Engenheiro responsavel: RENATO MONTEIRO BATISTA
#
# Este script realiza a atualização dos repositórios de atualização do XenServer 7.2
#
# Para maiores informações acesse https://github.com/rmbinformatica/bash-scripts
#
sudo sed -i.bak -e 's|^mirrorlist=|#mirrorlist=|g' -e 's|http://mirror.centos.org|http://vault.centos.org|g' -e 's|^#baseurl=http|baseurl=http|g' /etc/yum.repos.d/*.repo