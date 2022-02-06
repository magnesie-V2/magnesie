#!/bin/bash

# Install Docker & Docker-compose on node
g5k-setup-docker -t
sudo-g5k curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo-g5k chmod +x /usr/local/bin/docker-compose
sudo-g5k ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose


docker-compose up