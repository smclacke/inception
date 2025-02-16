
FROM	debian:bullseye

RUN		apt-get update \
			&& apt-get install -y nginx openssl \
			&& apt-get clean

# new-key 4096
RUN	openssl req \
	-newkey rsa:2048  \
	-x509 \
	-sha256 \
	-days 365 \
	-nodes \
	-out /etc/ssl/certs/smclacke.42.fr.crt \
	-keyout /etc/ssl/private/smclacke.42.fr.key \
	-subj "/C=NL/ST=Noord Holland/L=Amsterdam/O=Codam/OU=Sarah/CN=smclacke"

RUN		rm /etc/nginx/sites-available/default
COPY	nginx.conf /etc/nginx/sites-available/wordpress
RUN		rm /etc/nginx/sites-enabled/default
RUN 	ln -s /etc/nginx/sites-available/wordpress /etc/nginx/sites-enabled/

EXPOSE 	443

# makes nginx run in foreground to keep container running
# nginx - command
# -g - sets globally 
# daemon off - foreground or background container, off = running in foreground
ENTRYPOINT ["nginx", "-g", "daemon off;"]
