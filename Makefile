# **************************************************************************** #
#                                                                              #
#                                                         ::::::::             #
#    Makefile                                           :+:    :+:             #
#                                                      +:+                     #
#    By: smclacke <smclacke@student.codam.nl>         +#+                      #
#                                                    +#+                       #
#    Created: 2025/01/17 19:17:58 by smclacke      #+#    #+#                  #
#    Updated: 2025/02/20 17:44:20 by smclacke      ########   odam.nl          #
#                                                                              #
# **************************************************************************** #

COMPOSE = ./srcs/docker-compose.yml
ENV_FILE = ./srcs/.env

all		:	check_env build

check_env	:
	@if [ ! -f $(ENV_FILE) ]; then \
		echo "error: no env file found!"; \
		exit 1; \
	fi

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

re	: clean build

.PHONY: all build start stop down logs clean cleanVolumes cleanNetwork re
