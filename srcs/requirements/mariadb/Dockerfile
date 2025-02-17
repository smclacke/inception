
FROM debian:bullseye

RUN apt-get update -y \
		&& apt-get install -y mariadb-server \
		&& apt-get clean

COPY mariadb_script.sh /etc/mariadb_script.sh 
RUN chown mysql:root /etc/mariadb_script.sh 
RUN chmod +x /etc/mariadb_script.sh

COPY maria_conf.cnf /

RUN mkdir -p /var/run/mysqld; chown -R mysql:root /var/run/mysqld

EXPOSE 3306

ENTRYPOINT [ "/etc/mariadb_script.sh" ]
CMD [ "mysqld" ]
