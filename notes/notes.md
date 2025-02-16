
**INFO**

**cert locations:**
ssl: /etc/ssl/certs/smclacke.42.fr.crt
ssl: /etc/ssl/priavte/smclacke.42.fr.key

**error logs:**
sudo tail -f /var/log/php7.4-fpm.log
sudo tail -f /var/log/nginx/error.log
sudo tail -f /var/log/mysql/error.log

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

** docker-compose down && docker-compose up -d **
instead of make clean and make everytime

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

sudo docker volume create <volume name>
sudo docker volume ls
sudo docker volume rm [optional <volume_name>]

sudo docker network create <network name>
sudo docker network ls
sudo docker network rm [optional <network_name>]

docker exec -it <image> <bash>

**commands_explained**
docker kill will kill a container
docker rm will clean up a terminated container

stop: stop services only
down: stop and remove containers and networks (optionally images and volumes as well)
down --volumes: down and remove volumes
down --rmi <all/local>: down and remove images



**TEST nginx on its own in container**
docker run --name nginx-test -p 8080:80 -d nginx

**stuff i want in vm**
sudo
ssh
ssl
mkcerts
hosts -> add smclacke.42.fr to localhost
git
github
second browser
vscode

apt-get install systemd
 -- for systemctl command

**important**
/etc/hosts - change file so locahost has smclacken.42.fr also

**TODO**
