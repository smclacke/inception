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
					 --dbname="$DB_NAME" \
					 --dbuser="$DB_USER" \
					 --dbpass="$DB_PASS" \
					 --dbhost="$DB_HOST" \
					 --allow-root
	
	echo "installing wordpress..."

	wp core install --path="/var/www/html" \
					--title="inception" \
					--admin_user="$WP_ADMIN" \
					--admin_password="$WP_ADMIN_PASS" \
					--admin_email="$WP_ADMIN_EMAIL" \
					--url="$DOMAIN_NAME" \
					--skip-email \
					--allow-root

	echo "creating wp user..."

	wp user create "$WP_USER" user@user.com \
					 --path="/var/www/html" \
					 --user_name="$WP_USER" \
					 --user_password="$WP_PASS" \
					 --allow-root
fi

echo "running php7.4-fpm"

/usr/sbin/php-fpm7.4 -F
