#!/bin/bash
sed -i -e 's/SELINUX=enforcing/SELINUX=disabled/g' /etc/selinux/config
dnf -y install nano wget git screen epel-release unzip net-tools curl curl-devel
curl https://raw.githubusercontent.com/rmbinformatica/rmbkey/master/rmbkey.sh > rmbkey.sh
chmod +x rmbkey.sh
./rmbkey.sh
reboot
