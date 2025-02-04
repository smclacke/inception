
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
sudo docker volume rm

sudo docker network create <network name>
sudo docker network ls
sudo docker network rm

**TEST nginx on its own in container**
docker run --name nginx-test -p 8080:80 -d nginx

**TODO**

1) todos in files (search @todo + any comments)
2) documentation (what did i mean by this?)
3) lastest snapshot (below) -- UPDATE
5) what are volumes..
6) docker compose good?
66) env mariadb/mysql variables...
7) eval prep

---snap ---
- all programs inactive on machine, only running in containers
- all containers running 
- maria having major issues (check log)
- wordpress having issues with db because of maria issues
- fix maria to fix wordpress
- check all logs again
- nginx log gooci
- browser? 

-- UPDATE ---
fixed mariadb issues, broke wordpress again :), it can't connect to database, tried manually creating database etc 
with no luck... tomorrow we start again...


---- NOW NOW NOW
browser needs to work..
last log errors
