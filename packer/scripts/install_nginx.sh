#!/bin/bash
set -e
sudo apt-get -y update
sudo apt-get -y install nginx
sudo ufw allow 'Nginx HTTP'
sudo ufw reload
sudo ufw status
systemctl status nginx

git clone https://github.com/Vladyslav-Stepanenko/nginx-test.git /home/ubuntu/nginx-test
sudo mv /etc/nginx/nginx.conf /home/ubuntu/nginx-test/nginx.conf

sudo mkdir -p /home/ubuntu/www
sudo mv /home/ubuntu/nginx-test/index.html /home/ubuntu/www/index.html

sudo systemctl restart nginx
systemctl status nginx