#!/bin/bash
# (C) 2020 RMB Informatica - www.rmbinformatica.com
# Engenheiro responsavel: RENATO MONTEIRO BATISTA
#
# Este script prepara uma instalação do Samba (compartilhamento de arquivos windows) em um
# servidor CentOS 8 instalado a partir da versão Minimal.
#
# Para maiores informações acesse https://github.com/rmbinformatica/bash-scripts
#
dnf -y install samba samba-common samba-client
cp /etc/samba/smb.conf /etc/samba/old.smb.conf
wget https://raw.githubusercontent.com/rmbinformatica/bash-scripts/main/config-exemplo/modelo_pasta_publica_e_usuarios-smb.conf -O /etc/samba/smb.conf
nano /etc/samba/smb.conf
testparm
firewall-cmd --add-service=samba --zone=public --permanent
firewall-cmd --reload
systemctl enable smb
systemctl enable nmb
systemctl start smb
systemctl start nmb
echo "Adicao de usuarios ao samba:"
echo "useradd renato"
echo "passwd renato"
echo "smbpasswd -a renato"
echo "systemctl reload smb"