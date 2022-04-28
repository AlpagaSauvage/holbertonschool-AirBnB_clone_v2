#!/usr/bin/env bash
# Prepare your web servers

sudo apt update
sudo apt -y install nginx

mkdir -p /data/web_static/releases/test/ /data/web_static/shared/
touch /data/web_static/releases/test/index.html
chmod 777 /data/web_static/releases/test/index.html
echo "test" >> /data/web_static/releases/test/index.html
ln -sf /data/web_static/current /data/web_static/releases/test/
chown -hR ubuntu /data/
sed -i "/listen 80 default_server;/a location /hbnb_static/ {alias /data/web_static/current/};" /etc/nginx/sites-available/default

sudo /etc/init.d/nginx restart
