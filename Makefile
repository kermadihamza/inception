# IF you have docker-compose down, why would you need docker container rm ?

all:
	mkdir -p /home/hakermad/data/wordpress
	mkdir -p /home/hakermad/data/mariadb
	docker compose -f ./srcs/docker-compose.yml up -d --build

down:
	docker compose -f ./srcs/docker-compose.yml down

clean:
	docker container stop $$(docker container ls -aq);\
	docker container rm $$(docker container ls -aq);\
	docker rmi $$(docker images -aq);\
	docker network rm $(docker network ls -q);\
	docker system prune -a --volumes;\
	docker volume rm $$(docker volume ls -q);\
	rm -rf /home/hakermad/data;
