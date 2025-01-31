
FROM debian:bullseye

RUN apt-get update -y && apt-get install -y mariadb-server && mysql_secure_installation

COPY 50-server.cnf /etc/mysql/mariadb.config.d/

COPY script.sh /

RUN chmod +x /script.sh

EXPOSE 3306

CMD ["/script.sh"]
