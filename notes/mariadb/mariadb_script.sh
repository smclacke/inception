#!/bin/bash

service mysql start
mysql_secure_installation

mariadb -e "CREATE DATABASE IF NOT EXISTS \'${DB_NAME}\';"
mariadb -e "CREATE USER IF NOT EXISTS \'${DB_USER}\'@'%' IDENTIFIED BY '${DB_PASS}';"
mariadb -e "GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO \'${DB_USER}\'@'%';"
mariadb -e "FLUSH PRIVILEGES;"
exit

mysql -u $DB_ROOT -p version
