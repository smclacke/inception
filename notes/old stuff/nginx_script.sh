#!/bin/bash

## initial installation ##
apt update
apt install ssh
apt install ufw
ufw app list
ufw allow OpenSSH
ufw enable
ufw status

apt install nginx
ufw allow 'Nginx Full' # / Nginx HTTP || Nginx HTTPS
ufw status # check it has been added to the HTTP traffic list, full = ports 80 and 443
# 443 has TLS/SSL encryption || 80 has normal unencrypted web traffic
#--------------------------------------------------------------------------------------------#

## Nginx process management ##
nginx -t
systemctl reload nginx
systemctl status nginx # / systemctl stop nginx || systemctl start nginx 
# ++ restart, reload, disable, enable
#--------------------------------------------------------------------------------------------#

## setting up server block ##
#--------------------------------------------------------------------------------------------#
rm /etc/nginx/sites-available/*
cp nginx.conf /etc/nginx/sites-available/
rm /etc/nginx/sites-enabled/*
ln -s /etc/nginx/sites-available/nginx.conf /etc/nginx/sites-enabled/


## @todo AM I EVEN USING THIS SCRIPT??