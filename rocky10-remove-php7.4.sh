#!/bin/bash
sudo systemctl stop php-fpm
sudo systemctl disable php-fpm
sudo dnf remove -y php\*
sudo dnf module list php
sudo dnf remove -y remi-release
sudo rm -f /etc/yum.repos.d/remi*.repo
sudo dnf autoremove -y
sudo dnf clean all
sudo systemctl daemon-reload
php -v