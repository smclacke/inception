# **************************************************************************** #
#                                                                              #
#                                                         ::::::::             #
#    Makefile                                           :+:    :+:             #
#                                                      +:+                     #
#    By: smclacke <smclacke@student.codam.nl>         +#+                      #
#                                                    +#+                       #
#    Created: 2025/01/17 19:17:58 by smclacke      #+#    #+#                  #
#    Updated: 2025/02/13 17:07:18 by smclacke      ########   odam.nl          #
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

ps	:
	sudo docker ps

psa :
	sudo docker ps -a

logs	:
	sudo docker-compose -f srcs/docker-compose.yml logs

clean	: stop
	sudo docker rm wordpress nginx mariadb
	sudo docker volume rm mariadb wordpress
	sudo docker system prune --all

kill :
	sudo docker-compose -f srcs/docker-compose.yml kill 

re	: down up start
