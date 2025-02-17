#!/bin/bash

echo "creating self-signed SSL certificates"

openssl req \
	-x509 \
	-nodes \
	-days 365 \
	-newkey rsa:2048  \
	-subj "/C=NL/ST=Holland/L=Amsterdam/O=Codam/CN=${DOMAIN_NAME}" \
	-out "/etc/nginx/ssl/selfsigned.crt" \
	-keyout "/etc/nginx/ssl/selfsigned.key"

echo "starting nginx"

exec nginx -g "daemon off;"

# makes nginx run in foreground to keep container running
# nginx - command
# -g - sets globally 
# daemon off - foreground or background container, off = running in foreground