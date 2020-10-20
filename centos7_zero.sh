#!/bin/bash
# (C) 2020 RMB Informatica - www.rmbinformatica.com
# Engenheiro responsavel: RENATO MONTEIRO BATISTA
#
# Este script prepara uma instalação do Centos7 Minimal com as ferramentas básicas
# e chaves SSH da empresa, além de desativar o SeLinux. Voltado para servidores de
# uso interno.
#
# Para maiores informações acesse https://github.com/rmbinformatica/bash-scripts
#
sed -i -e 's/SELINUX=enforcing/SELINUX=disabled/g' /etc/selinux/config
yum -y install nano wget git screen epel-release unzip net-tools curl curl-devel
curl https://raw.githubusercontent.com/rmbinformatica/rmbkey/master/rmbkey.sh > rmbkey.sh
chmod +x rmbkey.sh
./rmbkey.sh
reboot