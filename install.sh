#!/bin/bash

sudo apt-get update
sudo apt-get upgrade
sudo apt install docker.io
sudo systemctl enable --now docker
sudo apt-get install docker-compose
sudo groupadd docker
sudo usermod -aG docker $USER
sudo chown -R $USER *
sudo chgrp -R $USER *

