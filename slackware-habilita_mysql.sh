#!/bin/bash
# (C) 2013 - RMB Informatica - www.rmbinformatica.com
# Elaborado por Renato Monteiro Batista
#
# Objetivos: habilitar o serviço mysql em servidores linux slackware
#
#
# Criacao do diretorio de dados do mysql, ajuste de permissoes para usuario.
mkdir -p /var/run/mysql
chown -R mysql.mysql /var/run/mysql
# Copia modelo de configuracao baseado no template small
cp /etc/my-small.cnf /etc/my.cnf
# Habilita o servico para inicializacao automatica
chmod +x /etc/rc.d/rc.mysqld
# Instala o banco de dados
mysql_install_db --user=mysql
# Lembrete final ao usuario
echo "Para definir a senha do administrador use: /usr/bin/mysqladmin -u root password 'senha'"