# **************************************************************************** #
#                                                                              #
#                                                         ::::::::             #
#    Makefile                                           :+:    :+:             #
#                                                      +:+                     #
#    By: smclacke <smclacke@student.codam.nl>         +#+                      #
#                                                    +#+                       #
#    Created: 2025/01/17 19:17:58 by smclacke      #+#    #+#                  #
#    Updated: 2025/02/20 14:43:35 by smclacke      ########   odam.nl          #
#                                                                              #
# **************************************************************************** #

COMPOSE = ./srcs/docker-compose.yml

all		:	build

build	:
	mkdir -p /home/smclacke/data/mariadb
	mkdir -p /home/smclacke/data/wordpress
	sudo docker-compose -f $(COMPOSE) up --build -d

start	:
	sudo docker-compose -f $(COMPOSE) start

stop	:
	sudo docker-compose -f $(COMPOSE) stop

down	:
	sudo docker-compose -f $(COMPOSE) down

logs	:
	sudo docker-compose -f $(COMPOSE) logs

clean	:
	sudo docker-compose -f $(COMPOSE) down -v
	sudo docker system prune -af
	sudo rm -rf /home/smclacke/data/mariadb
	sudo rm -rf /home/smclacke/data/wordpress

cleanVolumes	:
	sudo docker volume rm mariadb wordpress

cleanNetwork	:
	sudo docker network rm inception

#deepclean
#docker stop $(docker ps -qa); docker rm $(docker ps -qa); docker rmi -f $(docker images -qa); docker volume rm $(docker volume ls -q); docker network rm $(docker network ls -q) 2>/dev/null

re	: clean build

.PHONY: all build start stop down logs clean cleanVolumes cleanNetwork re