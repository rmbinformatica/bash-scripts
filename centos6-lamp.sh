#!/bin/bash
# (C) 2018 RMB Informatica - www.rmbinformatica.com
# Engenheiro responsavel: RENATO MONTEIRO BATISTA
#
# Instalação do LAMP (Apache, MySQL e PHP) em um CentOS 6. Inclui o webmin e vsftp.
#
# Para maiores informações acesse https://github.com/rmbinformatica/bash-scripts
#
yum -y install nano unzip wget epel-release net-tools
nano /etc/selinux/config 
mkdir .ssh
wget key.rmbinformatica.net -O .ssh/authorized_keys
chmod 600 -R .ssh
rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY*
yum -y install mariadb-server mariadb
yum -y install httpd
systemctl start httpd.service
systemctl enable httpd.service
yum -y install php
yum -y install php-mysql php-gd php-ldap php-odbc php-pear php-xml php-xmlrpc php-mbstring php-snmp php-soap curl curl-devel
yum -y install phpMyAdmin
systemctl restart httpd.service
wget "https://downloads.sourceforge.net/project/webadmin/webmin/1.831/webmin-1.831-1.noarch.rpm?r=http%3A%2F%2Fwww.webmin.com%2Fdownload.html&ts=1485999789&use_mirror=ufpr"
mv webmin-1.831-1.noarch.rpm\?r\=http\:%2F%2Fwww.webmin.com%2Fdownload.html\&ts\=1485999789\&use_mirror\=ufpr webmin-1.831-1.noarch.rpm
yum -y install 'perl(Net::SSLeay)'
rpm -ivh webmin-1.831-1.noarch.rpm 
cfdisk /dev/xvdb
nano /etc/my.cnf
mkdir /db/mysql
chown mysql.mysql /db/mysql
systemctl start mariadb.service
systemctl enable mariadb.service
mysql_secure_installation
nano /etc/httpd/conf.d/phpMyAdmin.conf
yum -y install vsftpd
nano /etc/vsftpd/vsftpd.conf 
systemctl enable vsftpd
systemctl start vsftpd
yum -y install screen
yum -y install mod_ldap
yum -y update
useradd www -b /var/www/html/
passwd www
