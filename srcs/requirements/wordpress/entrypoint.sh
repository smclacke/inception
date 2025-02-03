#!/bin/bash

#@todo
#if (/var/www + /var/www/html exist, remove and make new) 

mkdir /var/www/
mkdir /var/www/html

cd /var/www/html

rm -rf *

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp
cp www.conf /etc/php/7.4/fpm/pool.d/www.conf

wp core download --allow-root

mv /var/www/html/wp-config-sample.php /var/www/html/wp-config.php

sed -i -r "s/database/$DB_NAME/1" wp-config.php
sed -i -r "s/databse_user/$DB_USER/1" wp-config.php
sed -i -r "s/password/$DB_PASS/1" wp-config.php
sed -i -r "s/localhost/mariadb/1" wp-config.php

wp core install --url=$DOMAIN_NAME --title=$WP_TITLE --admin_user=$WP_ADMIN --admin_password=$WP_ADMIN_PASS --allow-root
wp user create $WP_USER --role=author --user_pass=$WP_PASS --allow-root
wp theme install astra --activate --allow-root
wp plugin install redis-cache --activate --allow-root

sed -i 's/listen = \/run\/php\/php7.4-fpm.sock/listen = 9000/g' /etc/php/7.4/fpm/pool.d/www.conf
mkdir /run/php

/usr/sbin/php-fpm7.4 -F
