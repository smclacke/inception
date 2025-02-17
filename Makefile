# **************************************************************************** #
#                                                                              #
#                                                         ::::::::             #
#    Makefile                                           :+:    :+:             #
#                                                      +:+                     #
#    By: smclacke <smclacke@student.codam.nl>         +#+                      #
#                                                    +#+                       #
#    Created: 2025/01/17 19:17:58 by smclacke      #+#    #+#                  #
#    Updated: 2025/02/17 15:33:25 by smclacke      ########   odam.nl          #
#                                                                              #
# **************************************************************************** #

COMPOSE = ./srcs/docker-compose.yml

all		:	build

build	:
	mkdir -p ${HOME}/data/mariadb
	mkdir -p ${HOME}/data/wordpress
	sudo docker-compose -f $(COMPOSE) up --build -d

down	:
	sudo docker-compose -f $(COMPOSE) down

logs	:
	sudo docker-compose -f $(COMPOSE) logs

clean	: down
	sudo docker system prune -af
	sudo docker volume prune -f
	sudo rm -rf ${HOME}/data/mariadb
	sudo rm -rf ${HOME}/data/wordpress

deepclean	: clean
	docker stop $(docker ps -qa); docker rm $(docker ps -qa); docker rmi -f $(docker images -qa); docker volume rm $(docker volume ls -q); docker network rm $(docker network ls -q) 2>/dev/null

re	: down build

.PHONY: all build down logs clean deepclean re