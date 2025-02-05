#!/bin/bash -e

if [ -d "/var/lib/mysql/$MARIADB_DATABASE" ]
then
	echo "database already exists, continuing"
else
	echo "creating default database and user"

	{
		echo "FLUSH PRIVILEGES;"
		echo "CREATE DATABASE IF NOT EXISTS $MARIADB_DATABASE;"
		echo "CREATE USER IF NOT EXISTS $MARIADB_USER@'%' IDENTIFIED BY '$MARIADB_PASSWORD';"
		echo "GRANT ALL ON *.* TO $MARIADB_USER@'%' IDENTIFIED BY '$MARIADB_PASSWORD';"
		echo "FLUSH PRIVILEGES;"
	} | mysqld --bootstrap

	echo "created default database and user"
fi

exec "$@"
