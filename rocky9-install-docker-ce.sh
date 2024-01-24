#!/bin/bash
echo "Removendo podman e instalando o Docker CE"
sudo dnf remove -y podman buildah
sudo dnf install -y yum-utils
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
sudo dnf install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

echo "Configurando o servico docker"
sudo systemctl enable docker
sudo systemctl start docker
sudo systemctl status docker

echo "Adicionando permissoes para o usuario atual usar o docker"
sudo usermod -aG docker -a $USER
GROUP=$(id -g)
sudo newgrp docker
sudo newgrp $GROUP
unset GROUP

echo "Testando acesso ao docker"
docker ps

echo "Caso o comando anterior apresente algum erro, por favor faca logoff e login novamente para recarregar as permissoes"