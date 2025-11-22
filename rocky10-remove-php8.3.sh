#!/bin/bash
systemctl stop php-fpm
systemctl disable php-fpm
dnf remove -y php\*
dnf autoremove -y
dnf clean all
systemctl daemon-reload