#!/bin/bash
wget "https://cdn.mysql.com//Downloads/MySQL-5.7/mysql-5.7.25-1.el7.x86_64.rpm-bundle.tar"
wget "https://cdn.mysql.com//Downloads/Connector-J/mysql-connector-java-5.1.47.zip"
wget "https://product-downloads.atlassian.com/software/jira/downloads/atlassian-servicedesk-4.0.0-x64.bin"
chmod +x atlassian-servicedesk-4.0.0-x32.bin
yum -y install 'perl(Data::Dumper)'
sudo yum remove mariadb-libs
tar -xvf mysql-5.7.25-1.el7.x86_64.rpm-bundle.tar 
rpm -ivh mysql-community-common-5.7.25-1.el7.x86_64.rpm
rpm -ivh mysql-community-libs-5.7.25-1.el7.x86_64.rpm
rpm -ivh mysql-community-client-5.7.25-1.el7.x86_64.rpm 
rpm -ivh mysql-community-server-5.7.25-1.el7.x86_64.rpm 
rpm -qa | grep mysql
systemctl enable mysqld.service
cp /etc/my.cnf /root/old_my.cnf
cat <<EOF >> /etc/my.cnf
default-storage-engine=INNODB
character_set_server=utf8mb4
max_allowed_packet=256M
innodb_log_file_size=256M
EOF
systemctl start mysqld.service
grep 'temporary password' /var/log/mysqld.log
mysql_secure_installation
unzip mysql-connector-java-5.1.47.zip
echo "ATENCAO: Para conexao ao mysql, antes de iniciar o serviço no instalador execute (em outra sessao):"
echo "cp $PWD/mysql-connector-java-5.1.47/mysql-connector-java-5.1.47-bin.jar /opt/atlassian/jira/lib/"
sleep 5
chmod +x atlassian-servicedesk-4.0.0-x64.bin
./atlassian-servicedesk-4.0.0-x64.bin
echo "Crie o banco de dados:"
echo "CREATE DATABASE jiradb CHARACTER SET utf8mb4 COLLATE utf8mb4_bin;"