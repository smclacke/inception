
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

edit sites-available then:
rm /etc/nginx/sites-enabled/wordpress
sudo ln -s /etc/nginx/sites-available/wordpress /etc/nginx/sites-enabled/


***Docker***
docker ps -a to see all containers
sudo docker build -t maradb . - build the image
sudo docker run -d -v /run/mysqld:/run/mysqld mariadb - run the image in container

**TODO**

1) check www.config listen location WP
2) check mariadb 50-server.cnf locations etc
3) nginx script
4) check what should be in WP dockerfile and what in entrypoint script

5) what are volumes..