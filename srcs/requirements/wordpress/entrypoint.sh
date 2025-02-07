#!/bin/bash -e

if [ -f /var/www/html ]
then
	echo "directory exists, continue"
else
	mkdir -p /var/www/html
fi

if [ -f /var/www/html/wp-login.php ]
then
	echo "wordpress already installed"
else
	echo "downloading wordpress..."
	wp core download --path="/var/www/html" --allow-root
fi

if [ -f /var/www/html/wp-config.php ]
then
	echo "wordpress already configured"
else
	echo "creating wordpress config..."

	cd /var/www/html
	wp config create --path="/var/www/html" \
					 --dbname="$WORDPRESS_DB_NAME" \
					 --dbuser="$WORDPRESS_DB_USER" \
					 --dbpass="$WORDPRESS_DB_PASSWORD" \
					 --dbhost="$WORDPRESS_DB_HOST" \
					 --allow-root
	
	echo "installing wordpress..."

	wp core install --path="/var/www/html" \
					--title="inception" \
					--admin_user="$WORDPRESS_ADMIN_NAME" \
					--admin_password="$WORDPRESS_ADMIN_PASSWORD" \
					--admin_email="$WORDPRESS_ADMIN_EMAIL" \
					--url="$DOMAIN_NAME" \
					--skip-email \
					--allow-root

	echo "creating wp user..."

	wp user create "$WORDPRESS_USER_NAME" user@user.com \
					 --path="/var/www/html" \
					 --user_password="$WORDPRESS_USER_PASSWORD" \
					 --allow-root
fi

echo "running php7.4-fpm"

/usr/sbin/php-fpm7.4 -F
