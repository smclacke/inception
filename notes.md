
**INFO**

cert locations:
ssl: /etc/ssl/certs/smclacke.42.fr.crt
ssl: /etc/ssl/priavte/smclacke.42.fr.key

error logs:
sudo tail -f /var/log/php7.4-fpm.log
sudo tail -f /var/log/nginx/error.log

change rights:
sudo find /path/to/wordpress/ -type d -exec chmod 755 {} \;
sudo find /path/to/wordpress/ -type f -exec chmod 644 {} \;
sudo chmod 440 /path/to/wordpress/wp-config.php

test and reload nginx:
sudo nginx -t
sudo systemctl reload nginx

test and restart php:
sudo systemctl status php7.4-fpm
sudo systemctl restart php7.4-fpm



**TODO**

1) check vm IP

2) Testing if Nginx/PHP-FPM works
Before we install Wordpress, let's make sure that our nginx/php installation works as expected

mkdir /var/www/wordpress.devops.esc.sh
cd /var/www/wordpress.devops.esc.sh
echo '<?php phpinfo(); ?>' > info.php
Now open wordpress.devops.esc.sh/info.php and it should show the php info page. That means we are good.

Make sure to delete the info.php file

rm info.php

