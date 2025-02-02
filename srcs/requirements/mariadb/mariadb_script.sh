#!/bin/bash

#sudo systemctl start mariadb.service
#sudo service mariadb start
sudo service mysql start
sudo mysql_secure_installation #need??

mariadb -e "CREATE DATABASE IF NOT EXISTS \'${DB_NAME}\';"
mariadb -e "CREATE USER IF NOT EXISTS \'${DB_USER}\'@'%' IDENTIFIED BY '${DB_PASS}';"
mariadb -e "GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO \'${DB_USER}\'@'%';"
mariadb -e "FLUSH PRIVILEGES;"
exit # this or the kill call?

#kill $(cat /var/run/mysqld/mysqld.pid) #need??

#mysqld #need??
# or mysqladmin?
mysql -u $DB_ROOT -p version # this???

# these??
#mysqladmin -u root -p $DB_ROOT_PASS shutdown
#mysqld_safe --port=3306 --bind-address=0.0.0.0 --datadir='/var/lib/mysql'


# @todo all these questions... which is a working version?