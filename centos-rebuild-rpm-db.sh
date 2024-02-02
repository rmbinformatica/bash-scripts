#!/bin/bash
# (C) 2024 RMB Informatica - www.rmbinformatica.com
# Engenheiro responsavel: RENATO MONTEIRO BATISTA
#
# Este script reconstroi a base de dados de pacotes RPM do CentOS
# Resolvendo o erro: Error: rpmdb open failed
#
# Para maiores informações acesse https://github.com/rmbinformatica/bash-scripts
#
hoje=$(date +%Y%m%d)
# Se náo for root interromper a execucao do script
if [ "$(id -u)" != "0" ]; then
   echo "Este script deve ser executado como root" 1>&2
   exit 1
fi
echo "Criando um backup da base de dados atual"
mkdir /root/backups.rpm.$hoje
cp -avr /var/lib/rpm/ /root/backups.rpm.$hoje
rm -f /var/lib/rpm/__db*
db_verify /var/lib/rpm/Packages
rpm --rebuilddb
yum clean all
