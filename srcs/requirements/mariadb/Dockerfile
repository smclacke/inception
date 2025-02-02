
FROM debian:bullseye

RUN apt-get update -y && apt-get install mariadb-server -y

COPY 50-server.cnf /etc/mysql/mariadb.config.d/

COPY script.sh /etc

RUN chmod +x /etc/script.sh

EXPOSE 3306

CMD ["/etc/script.sh"]
