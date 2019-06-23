# Docker for Java Developers Course
Managing containers, Dockerfiles, Tomcat Applications, Spring Boot in Docker, Networking, Volumes, Maven, Docker Compose, Docker Swarm, Docker Stacks

### Useful commands:

- docker image ls
- docker image build -t jdk-image .

- docker container ls -a
- docker container top webhost
- docker container logs webhost
- docker container run -p 80:80 -d --name webhost nginx

- docker top <mongo>
- docker container inspect mongo
- docker container stats mongo

- docker container port mysql
- docker container inspect --format '{{ .NetworkSettings.IPAddress  }}’ mysql

- docker network ls
- docker network inspect
- docker network create —driver (optional if you need a specific driver)
- docker network create my_app_net (create a new network)
- docker network connect
- docker network connect my_app_net nginx1 (connect nginx1 to network my_app_net)
- docker network inspect my_app_net
- docker network disconnect

DNS: docker uses container names talking to each other
DNS works not for the default bridge, so you have to create network for containers to talk to each other

- docker network create <dude>
- docker container run -d --name my_very_new_nginx --network my_app_net ngin>
- docker container exec -it nginx1 ping new_nginx

/ # mysql -uroot -ppassword -hdatabase  	//connect from a container in a network to a database on a container in the 						same network via container name (in that case database

- docker container run -d —-net dude —net-alias search elasticsearch:2
- docker history <nginx>

- docker volume ls
- docker volume prune
- docker container run -v mydata:/var/lib/mysql -d  -e MYSQL_ROOT_PASSWORD=password -e MYSQL_DATABASE=fleetman mysql
- docker volume inspect mydata

## Dockerfile
![Dockerfile](https://github.com/andiausrust/docker-for-java-fleetman-example/blob/master/docker-compose.png)

## docker-compose.yml
![Dockerfile](https://github.com/andiausrust/docker-for-java-fleetman-example/blob/master/Dockerfile.png)


