init:
	mkdir -p ${HOME}/data/wp ${HOME}/data/db
up: 
	docker-compose -f ./srcs/docker-compose.yml up --build 
down:
	docker-compose -f ./srcs/docker-compose.yml down
clean:
	rm -rf ${HOME}/data/wp ${HOME}/data/db
fclean:
	docker rm -f $(docker ps -a -q)
	docker image rmi -f $(docker images -q)
	docker network rm $(docker network ls -q)
	docker volume rm -f $(docker volume ls -q)
re:
	clean fclean init up