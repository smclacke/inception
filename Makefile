# **************************************************************************** #
#                                                                              #
#                                                         ::::::::             #
#    Makefile                                           :+:    :+:             #
#                                                      +:+                     #
#    By: smclacke <smclacke@student.codam.nl>         +#+                      #
#                                                    +#+                       #
#    Created: 2025/01/17 19:17:58 by smclacke      #+#    #+#                  #
#    Updated: 2025/02/02 18:28:13 by smclacke      ########   odam.nl          #
#                                                                              #
# **************************************************************************** #

all		:	up

up		:
	sudo docker-compose -f srcs/docker-compose.yml up -d

down	:
	sudo docker-compose -f srcs/docker-compose.yml down

stop	:
	sudo docker-compose -f srcs/docker-compose.yml stop

start	:
	sudo docker-compose -f srcs/docker-compose.yml start

status	:
	sudo docker ps

logs	:
	sudo docker-compose -f srcs/docker-compose.yml logs

clean	:
	sudo docker system prune --all

remove	:
	sudo docker rm --all

kill :
	sudo docker-compose -f srcs/docker-compose.yml kill 

re	: down up start
