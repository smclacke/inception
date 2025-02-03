#!/bin/bash -e

if [ -d "/var/lib/mysql/$MYSQL_DATABASE" ]
then
	echo "database already exists, continuing"
else
	echo "creating default database and user"

	{
		echo "FLUSH PRIVILEGES;"
		echo "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;"
		echo "CREATE USER IF NOT EXISTS $MYSQL_USER@'%' IDENTIFIED BY '$MYSQL_PASSWORD';"
		echo "GRANT ALL ON *.* TO $MYSQL_USER@'%' IDENTIFIED BY '$MYSQL_PASSWORD';"
		echo "FLUSH PRIVILEGES;"
	} | mysqld --bootstrap

	echo "created default database and user"
fi

exec "$@"
