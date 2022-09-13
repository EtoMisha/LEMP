all: build up

re: fclean all

build: 
	mkdir -p /home/${USER}/data/db
	mkdir -p /home/${USER}/data/wp
	docker-compose -f srcs/docker-compose.yml build

up: 
	docker-compose -f srcs/docker-compose.yml up -d

down:
	docker-compose -f srcs/docker-compose.yml down

ps:
	docker-compose -f srcs/docker-compose.yml ps

images:
	docker-compose -f srcs/docker-compose.yml images

fclean: down
	sudo rm -rf /home/${USER}/data/db
	sudo rm -rf /home/${USER}/data/wp


.PHONY: all re build up down ps images