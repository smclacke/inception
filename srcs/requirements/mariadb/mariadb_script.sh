#!/bin/bash -e

if [ -d "/var/lib/mysql/$DB_NAME" ]
then
	echo "database already exists, continuing"
else
	echo "creating default database and user"

	{
		echo "FLUSH PRIVILEGES;"
		echo "CREATE DATABASE IF NOT EXISTS $DB_NAME;"
		echo "CREATE USER IF NOT EXISTS $DB_USER@'%' IDENTIFIED BY '$DB_PASS';"
		echo "GRANT ALL ON *.* TO $DB_USER@'%' IDENTIFIED BY '$DB_PASS';"
		echo "FLUSH PRIVILEGES;"
	} | mysqld --bootstrap

	echo "created default database and user"
fi

exec "$@"
