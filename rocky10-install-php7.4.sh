#!/bin/bash
sudo dnf update -y
sudo dnf upgrade -y
sudo dnf install -y epel-release
sudo dnf install -y https://rpms.remirepo.net/enterprise/remi-release-10.rpm
sudo dnf module list php
sudo dnf module enable php:remi-7.4 -y
sudo dnf install -y php php-cli php-fpm php-mysqlnd php-curl php-gd php-zip php-mbstring php-xml
systemctl restart httpd
systemctl restart php-fpm