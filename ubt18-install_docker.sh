#!/bin/bash
sudo apt-get update
sudo apt-get remove docker docker-engine docker.io
sudo apt -y install docker.io
sudo apt -y install docker-compose
sudo systemctl start docker
sudo systemctl enable docker