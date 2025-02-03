
**INFO**

**cert locations:**
ssl: /etc/ssl/certs/smclacke.42.fr.crt
ssl: /etc/ssl/priavte/smclacke.42.fr.key

**error logs:**
sudo tail -f /var/log/php7.4-fpm.log
sudo tail -f /var/log/nginx/error.log

**change rights:**
sudo find /path/to/wordpress/ -type d -exec chmod 755 {} \;
sudo find /path/to/wordpress/ -type f -exec chmod 644 {} \;
sudo chmod 440 /path/to/wordpress/wp-config.php

**check the scripts for nginx:**
sudo nginx -t

**system control:**
( nginx | php7.4-fpm | mariadb )
sudo systemctl status
sudo systemctl start
sudo systemctl stop
sudo systemctl restart
sudo systemctl kill (check this one)
sudo systemctl reload (nginx)

**edit sites-available then:**
rm /etc/nginx/sites-enabled/wordpress
sudo ln -s /etc/nginx/sites-available/wordpress /etc/nginx/sites-enabled/

**Docker**
docker ps -a to see all containers

- build the image, name + location -
sudo docker build -t maradb .

- run image in container -
sudo docker run -d -v /run/mysqld:/run/mysqld mariadb
OR 
sudo docker run -d name_of_image mariadb:latest
OR (USE THIS ONE)
sudo docker run --name <name> -d <image/ID>

sudo docker stop <container>
sudo docker logs <container>


**TEST nginx on its own in container**
docker run --name nginx-test -p 8080:80 -d nginx

**TODO**

1) todos in files (search @todo + any comments)
2) documentation
3) docker log errors
4) get it up and running in browser like without containers, a happier time
5) what are volumes..

