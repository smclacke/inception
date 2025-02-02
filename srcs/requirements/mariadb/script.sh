#!/bin/bash

#sudo systemctl start mariadb.service
#sudo service mariadb start
sudo service mysql start
#sleep 5

mariadb -e "CREATE DATABASE IF NOT EXISTS \'${DB_NAME}\';"
mariadb -e "CREATE USER IF NOT EXISTS \'${DB_USER}\'@'%' IDENTIFIED BY '${DB_PASS}';"
mariadb -e "GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO \'${DB_USER}\'@'%';"
mariadb -e "FLUSH PRIVILEGES;"

kill $(cat /var/run/mysqld/mysqld.pid)

mysqld

#mysqladmin -u root -p $DB_ROOT_PASS shutdown
#mysqld_safe --port=3306 --bind-address=0.0.0.0 --datadir='/var/lib/mysql'
