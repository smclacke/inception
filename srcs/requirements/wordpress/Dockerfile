FROM	debian:bullseye

RUN		apt-get update -y \
			&& apt-get -y install \
			wget \
			curl \
			bash \
			php7.4 \
			php7.4-mysql \
			php7.4-fpm \
			mariadb-client

COPY	entrypoint.sh /etc/entrypoint.sh
RUN 	chmod +x /etc/entrypoint.sh

COPY	www.conf /etc/php/7.4/fpm/pool.d/www.config

RUN 	curl -L https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar -o wp-cli.phar \
		&& chmod +x wp-cli.phar \
		&& mv wp-cli.phar /usr/local/bin/wp

#RUN		mkdir /run/php

EXPOSE	9000

ENTRYPOINT ["/etc/entrypoint.sh"]
