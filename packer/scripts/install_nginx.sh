#!/bin/bash
set -e
sudo apt-get -y update
sudo apt-get -y install nginx
sudo ufw allow 'Nginx HTTP'
sudo ufw reload
sudo ufw status
systemctl status nginx
git clone https://github.com/Vladyslav-Stepanenko/nginx-test.git /home/ubuntu/nginx-test
sudo cp /home/ubuntu/nginx-test/index.html /var/www/html/index.html