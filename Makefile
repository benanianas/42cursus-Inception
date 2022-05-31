init:
	mkdir -p /home/abenani/data/wp /home/abenani/data/db
up: 
	docker-compose -f ./srcs/docker-compose.yml up --build
down:
	docker-compose -f ./srcs/docker-compose.yml down
clean:
	- rm -rf /home/abenani/data
fclean:
	- clean
	- docker rm -f srcs_wordpress srcs_nginx srcs_mariadb \
					srcs_redis srcs_adminer srcs_ftp \
					srcs_cadvisor srcs_website
	- docker rmi -f srcs_wordpress srcs_nginx srcs_mariadb \
					srcs_redis srcs_adminer srcs_ftp \
					srcs_cadvisor srcs_website
	- docker volume rm srcs_db srcs_wp
	- docker network rm srcs_inception
re: fclean init up