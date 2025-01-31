#!/bin/bash

## initial installation ##
sudo apt update
sudo apt install ssh
sudo apt install ufw
sudo ufw app list
sudo ufw allow OpenSSH
sudo ufw enable
sudo ufw status

sudo apt install nginx
sudo ufw allow 'Nginx Full' # / Nginx HTTP || Nginx HTTPS
sudo ufw status # check it has been added to the HTTP traffic list, full = ports 80 and 443
# 443 has TLS/SSL encryption || 80 has normal unencrypted web traffic
#--------------------------------------------------------------------------------------------#

## Nginx process management ##
sudo nginx -t
systemctl reload nginx
systemctl status nginx # / systemctl stop nginx || systemctl start nginx 
# ++ restart, reload, disable, enable
#--------------------------------------------------------------------------------------------#

## setting up server block ##
#--------------------------------------------------------------------------------------------#
sudo rm /etc/nginx/sites-available/*
sudo cp nginx.conf /etc/nginx/sites-available/
sudo rm /etc/nginx/sites-enabled/*
sudo ln -s /etc/nginx/sites-available/nginx.conf /etc/nginx/sites-enabled/
