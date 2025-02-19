#!/bin/bash

mv /maria_conf.cnf /etc/mysql/mariadb.conf.d/maria_conf.cnf
chmod 644 /etc/mysql/mariadb.conf.d/maria_conf.cnf

mkdir -p /run/mysqld
mkdir -p /var/log/mysql
mkdir -p /var/lib/mysql
chown -R mysql:mysql /run/mysqld
chown -R mysql:mysql /var/log/mysql
chown -R mysql:mysql /var/lib/mysql

echo "Creating database"

{
	echo "FLUSH PRIVILEGES;"
	echo "CREATE DATABASE IF NOT EXISTS $MARIADB_DATABASE;"
	echo "CREATE USER IF NOT EXISTS $MARIADB_USER@'%' IDENTIFIED BY '$MARIADB_PASSWORD';"
	echo "GRANT ALL ON *.* TO $MARIADB_USER@'%' IDENTIFIED BY '$MARIADB_PASSWORD';"
	echo "FLUSH PRIVILEGES;"
	
}	| mysqld --bootstrap

echo "Starting Mariadb"
exec mysqld