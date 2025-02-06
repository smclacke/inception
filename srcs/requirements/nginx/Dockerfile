
FROM	debian:bullseye

RUN		apt-get update -y && apt-get install -y nginx
RUN 	apt-get update -y && apt-get install -y openssl

RUN 	mkdir /etc/nginx/ssl 
#need you?

RUN	openssl req \
	-newkey rsa:4096 \
	-x509 \
	-sha256 \
	-days 365 \
	-nodes \
	-out /etc/ssl/certs/smclacke.42.fr.crt \
	-keyout /etc/ssl/private/smclacke.42.fr.key \
	-subj "/C=NL/ST=Noord Holland/L=Amsterdam/O=Codam/OU=Sarah/CN=smclacke"

COPY	nginx.conf /etc/nginx/sites-available/default
RUN 	ln -s /etc/nginx/sites-available/default /etc/nginx/sites-enabled/

EXPOSE 	443

# makes nginx run in foreground to keep container running
ENTRYPOINT ["nginx", "-g", "daemon off;"]
