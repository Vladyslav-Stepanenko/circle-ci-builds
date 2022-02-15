#!/bin/bash
set -e
sudo apt-get -y update
sudo apt-get -y install nginx
sudo ufw allow 'Nginx HTTP'
sudo ufw reload
sudo ufw status
systemctl status nginx