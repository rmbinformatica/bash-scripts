#!/bin/bash
sudo dnf install -y php php-cli php-fpm php-mysqlnd php-gd php-mbstring php-xml php-zip php-curl
php -v
sudo systemctl enable --now php-fpm
sudo systemctl status php-fpm
sudo dnf clean all
sudo dnf autoremove -y
sudo systemctl restart httpd
sudo systemctl restart php-fpm