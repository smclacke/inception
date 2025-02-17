FROM debian:bullseye

RUN apt-get update -y && \
	apt-get install -y mariadb-server && \
	apt-get install -y curl

COPY ./tools/mariadb_script.sh / 
COPY ./tools/maria_conf.cnf /

RUN chmod +x /mariadb_script.sh

EXPOSE 3306

CMD [ "/mariadb_script.sh" ]