#!/usr/bin/env bash
# Setup web static

sudo apt update
sudo apt -y install nginx
sudo mkdir -p /data/web_static/releases/test/ /data/web_static/shared/
sudo touch /data/web_static/releases/test/index.html
sudo chmod 777 /data/web_static/releases/test/index.html
sudo echo 'zizi' >> /data/web_static/releases/test/index.html
sudo ln -sf /data/web_static/current /data/web_static/releases/test/
sudo chown -Rh ubuntu:ubuntu /data/
sudo sed -i '/server_name _;/a location /hbnb_static/ { alias /data/web_static/current/;}' /etc/nginx/sites-available/default
sudo /etc/init.d/nginx restart
