
FROM debian:bullseye

RUN apt-get update -y && apt-get install mariadb-server -y

COPY 50-server.cnf /etc/mysql/mariadb.config.d/

COPY mariadb_script.sh /etc/mariadb_script.sh 
# @todo or without file? - this is same as wp dockerfile

RUN chmod +x /etc/mariadb_script.sh

EXPOSE 3306

CMD ["/etc/mariadb_script.sh"]

# @todo CMD or entrypoint??