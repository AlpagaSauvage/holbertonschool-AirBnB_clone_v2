#!/usr/bin/env bash
# Setup web static

sudo apt -y update
sudo apt -y install nginx
mkdir -p /data/web_static/releases/test/ 
mkdir -p /data/web_static/shared/
touch /data/web_static/releases/test/index.html
echo 'zizi' > /data/web_static/releases/test/index.html
ln -sf /data/web_static/releases/test/ /data/web_static/current
chown -Rh ubuntu:ubuntu /data/
sed -i '/listen 80 default_server;/a location /hbnb_static/ { alias /data/web_static/current/;}' /etc/nginx/sites-available/default
sudo service nginx restart
