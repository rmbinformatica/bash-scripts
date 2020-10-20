#!/bin/bash
# (C) 2017 RMB Informatica - www.rmbinformatica.com
# Engenheiro responsavel: RENATO MONTEIRO BATISTA
#
# Configura a interface de rede de um CentOS 6 para o modo DHCP.
#
# Para maiores informações acesse https://github.com/rmbinformatica/bash-scripts
#
cat <<EOF > /etc/sysconfig/network-scripts/ifcfg-eth0
DEVICE=eth0
TYPE=Ethernet
ONBOOT=yes
BOOTPROTO=dhcp
IPV4_FAILURE_FATAL=yes
NAME="System eth0"
EOF

cat <<EOF > /etc/sysconfig/network-scripts/ifcfg-eth0
DEVICE=eth0
BOOTPROTO=static
BROADCAST=ABC.DEF.GHI.JKL
IPADDR= ABC.DEF.GHI.JKL
NETMASK=255.255.255.255
NETWORK= ABC.DEF.GHI.0
ONBOOT=yes
NM_CONTROLLED=no
EOF

cat <<EOF > /etc/resolv.conf
nameserver 1.1.1.1
nameserver 8.8.8.8
nameserver 8.8.4.4
EOF

cat <<EOF > /etc/sysconfig/network-scripts/route-eth0
192.168.20.1 dev eth0
default via 192.168.20.1 dev eth0
EOF