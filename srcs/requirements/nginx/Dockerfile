FROM debian:bullseye

RUN	apt-get update -y && \
	apt-get upgrade -y && \
	apt-get install -y nginx openssl net-tools -y

RUN mkdir -p /etc/nginx/ssl && \
	chmod 700 /etc/nginx/ssl

COPY	./tools/nginx.conf /etc/nginx/conf.d/default.conf
COPY 	./tools/nginx_script.sh /

RUN 	chmod +x /nginx_script.sh

EXPOSE 	443

CMD ["/nginx_script.sh"]