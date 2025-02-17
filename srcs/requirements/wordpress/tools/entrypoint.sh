#!/bin/bash

mkdir -p /var/www/html/wordpress
touch /run/php/php7.4-fpm.pid;
chown -R www-data:www-data /var/www/*;
chown -R 755 /var/www/*;

if [ -f wp-config.php ]; then

	curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
	chmod +x wp-cli.phar
	mv wp-cli.phar /usr/local/bin/wp

	cd /var/www/html/wordpress

	wp core download \
		--path="/var/www/html/wordpress/" \
		--allow-root
	echo "WP downloaded"

	echo "Mariadb connecting..."
	until mysqladmin -hmariadb -u${MARIADB_USER} -p${MARIADB_PASSWORD} ping; do
		sleep 2
	done

	echo "Creating WP configuration"
	wp config create \
		--path="/var/www/html/wordpress/" \
		--dbname="${MARIADB_DATABASE}" \
		--dbuser="${MARIADB_USER}" \
		--dbpass="${MARIADB_PASSWORD}" \
		--dbhost="${WORDPRESS_DB_HOST}" \
		--allow-root
	
	echo "Creating WP Admin"
	wp core install \
		--path="/var/www/htmlwordpress/" \
		--url="${DOMAIN_NAME}" \
		--title="inception" \
		--admin_user="${WORDPRESS_ADMIN_NAME}" \
		--admin_password="${WORDPRESS_ADMIN_PASSWORD}" \
		--admin_email="${WORDPRESS_ADMIN_EMAIL}" \
		--skip-email \
		--allow-root

	echo "Creating WP User"
	wp user create ${WORDPRESS_USER_NAME} ${WORDPRESS_ADMIN_EMAIL} \
		--path="/var/www/html/wordpress/" \
		--user_pass="${WORDPRESS_USER_PASSWORD}" \
		--role=editor \
		--allow-root
	
	echo "WP setup done!"
else
	echo "WP already downloaded and setup"
fi

echo "running php7.4-fpm"
exec /usr/sbin/php-fpm7.4 -F