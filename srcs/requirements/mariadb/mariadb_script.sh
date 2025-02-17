#!/bin/bash -e

mv /maria_conf.cnf /etc/mysql/mariadb.conf.d/
chmod 644 /etc/mysql/mariadb.conf.d/maria_conf.cnf

{
	echo "FLUSH PRIVILEGES;"
	echo "CREATE DATABASE IF NOT EXISTS $MARIADB_DATABASE;"
	echo "CREATE USER IF NOT EXISTS $MARIADB_USER@'%' IDENTIFIED BY '$MARIADB_PASSWORD';"
	echo "GRANT ALL ON *.* TO $MARIADB_USER@'%' IDENTIFIED BY '$MARIADB_PASSWORD';"
	echo "FLUSH PRIVILEGES;"
} | mysqld --bootstrap


sleep 5

exec "$@"
