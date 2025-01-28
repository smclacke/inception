#!/bin/bash

sudo apt update
sudo apt install mariadb-server
sudo mysql_secure_installation
{
	password shit...	
}

sudo systemctl start mariadb.service
sudo mariadb
{
	// in mariadb CLI
	// add user:
	GRANT ALL ON *.* TO smclacke@localhost IDENTIFIED BY '<password>' WITH GRANT OPTION;
	FLUSH PRIVILEGES;
	exit
}

sudo systemctl status mariadb
sudo mysqladmin version
mysqladmin -u smclacke -p version