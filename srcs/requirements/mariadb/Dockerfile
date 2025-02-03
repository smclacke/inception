
FROM debian:bullseye

RUN apt-get update -y && apt-get install mariadb-server -y

COPY mariadb_script.sh /etc/mariadb_script.sh 
RUN chown mysql:root /etc/mariadb_script.sh 
RUN chmod +x /etc/mariadb_script.sh

COPY 50-server.cnf /etc/mysql/mariadb.config.d/50-server.cnf
RUN chown -R mysql:root /etc/mysql/mariadb.conf.d

RUN mkdir -p /var/run/mysqld; chown -R mysql:root /var/run/mysqld

EXPOSE 3306

ENTRYPOINT [ "/etc/mariadb_script.sh" ]
CMD [ "mysqld" ]
