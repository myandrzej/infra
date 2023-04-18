#!/bin/bash

xhost +
sudo chown -R $USER *
sudo chgrp -R $USER *
docker-compose up
docker-compose down
xhost -
