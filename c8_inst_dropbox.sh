#!/bin/bash
dnf -y install libglapi libXext libXdamage libxshmfence libXxf86vm
curl -Lo dropbox-linux-x86_64.tar.gz https://www.dropbox.com/download?plat=lnx.x86_64
sudo mkdir -p /opt/dropbox
sudo tar xzfv dropbox-linux-x86_64.tar.gz --strip 1 -C /opt/dropbox
/opt/dropbox/dropboxd
sudo curl -Lo /usr/bin/dropbox.py https://www.dropbox.com/download?dl=packages/dropbox.py
chmod +x /usr/bin/dropbox.py
sudo curl -o /etc/init.d/dropbox https://gist.githubusercontent.com/thisismitch/6293d3f7f5fa37ca6eab/raw/2b326bf77368cbe5d01af21c623cd4dd75528c3d/dropbox
sudo curl -o /etc/systemd/system/dropbox.service https://gist.githubusercontent.com/thisismitch/6293d3f7f5fa37ca6eab/raw/99947e2ef986492fecbe1b7bfbaa303fefc42a62/dropbox.service
sudo chmod +x /etc/systemd/system/dropbox.service /etc/init.d/dropbox
sudo systemctl daemon-reload
sudo systemctl start dropbox
sudo systemctl enable dropbox