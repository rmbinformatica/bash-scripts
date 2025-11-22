#!/bin/bash
sudo dnf remove -y openvpn pkcs11-helper
sudo dnf install -y gcc make autoconf automake libtool pkgconfig   openssl-devel lz4-devel lzo-devel   pam-devel systemd-devel   pkcs11-helper-devel wget libcap-ng-devel
cd /usr/local/src
wget https://swupdate.openvpn.org/community/releases/openvpn-2.6.12.tar.gz
tar -zxvf openvpn-2.6.12.tar.gz
cd openvpn-2.6.12/
./configure --prefix=/usr/local --enable-systemd  --enable-pkcs11 --with-crypto-library=openssl --disable-dco
sudo make -j"$(nproc)"
sudo make install
/usr/local/sbin/openvpn --version
sudo ln -s /usr/local/sbin/openvpn /usr/local/bin/openvpn
hash -r
which openvpn
openvpn --version