# **************************************************************************** #
#                                                                              #
#                                                         ::::::::             #
#    Makefile                                           :+:    :+:             #
#                                                      +:+                     #
#    By: smclacke <smclacke@student.codam.nl>         +#+                      #
#                                                    +#+                       #
#    Created: 2025/01/17 19:17:58 by smclacke      #+#    #+#                  #
#    Updated: 2025/02/16 18:52:49 by smclacke      ########   odam.nl          #
#                                                                              #
# **************************************************************************** #

all		:	build

build	:
	sudo docker-compose -f srcs/docker-compose.yml up -d --build

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
	sudo docker volume rm wordpress mariadb
	sudo docker system prune --all

kill :
	sudo docker-compose -f srcs/docker-compose.yml kill 

re	: down up start
