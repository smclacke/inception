FROM	debian:bullseye

RUN		apt-get update \
			&& apt-get upgrade \
			&& apt-get install -y nginx openssl curl wget

RUN	openssl req \
	-newkey rsa:4096  \
	-x509 \
	-sha256 \
	-days 365 \
	-nodes \
	-out /etc/ssl/certs/smclacke.42.fr.crt \
	-keyout /etc/ssl/private/smclacke.42.fr.key \
	-subj "/C=NL/ST=Noord Holland/L=Amsterdam/O=Codam/OU=Sarah/CN=smclacke"

RUN 	mkdir /etc/nginx/ssl
COPY	nginx.conf /etc/nginx/conf.d/nginx.conf
RUN 	mkdir -p /run/nginx
COPY 	entrypoint.sh /etc/entrypoint.sh
RUN 	chmod +x /etc/entrypoint.sh

EXPOSE 	443

# makes nginx run in foreground to keep container running
# nginx - command
# -g - sets globally 
# daemon off - foreground or background container, off = running in foreground
ENTRYPOINT ["/etc/entrypoint.sh"]
CMD ["nginx", "-g", "daemon off;"]