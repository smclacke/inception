
FROM debian:bullseye

RUN apt-get update -y && apt-get install mariadb-server -y

COPY 50-server.cnf /etc/mysql/mariadb.config.d/

COPY script.sh /

RUN chmod +x /script.sh

EXPOSE 3306

CMD ["/script.sh"]
