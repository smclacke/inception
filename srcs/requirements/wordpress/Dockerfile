FROM	debian:bullseye

RUN		apt-get update && apt-get -y install \
			wget \
			curl \
			bash \
			php \
			php-cgi \
			php-mysql \
			php-fpm \
			php-pdo \
			php-gd php-cli \
			mariadb-client

COPY	entrypoint.sh /etc/entrypoint.sh
RUN 	chmod +x /etc/entrypoint.sh

COPY	www.config /etc/php/7.4/fpm/pool.d/www.config

EXPOSE	9000

ENTRYPOINT ["/etc/entrypoint.sh"]
