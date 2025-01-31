#!/bin/bash

sudo systemctl start mariadb.service
sudo service mariadb start
sleep 5

mariadb -e "CREATE DATABASE IF NOT EXISTS \'${DB_NAME}\';"
mariadb -e "CREATE USER IF NOT EXISTS \'${DB_USER}\'@'%' IDENTIFIED BY '${DB_PASS}';"
