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
FROM openjdk:alpine  

MAINTAINER Andi Mayer "amayer80@gmail.com"  
  
EXPOSE 8080  
  
WORKDIR /usr/local/bin/    
  
COPY maven/fleetman-0.0.1-SNAPSHOT.jar webapp.jar  
  
CMD ["java","-Dspring.profiles.active=docker","-Djava.security.egd=file:/dev/./urandom","-jar","webapp.jar"]  
  
## docker-compose.yml  
version: "3"  
  
services:  
  
  fleetman:  
    image: andiausrust/fleetman  
    networks:  
      - fleetman-network  
    ports:  
      - 80:8080  
    depends_on:  
      - database  
  
  database:  
    image: mysql  
    networks:  
      - fleetman-network  
    environment:  
      - MYSQL_ROOT_PASSWORD=password  
      - MYSQL_DATABASE=fleetman  
  

networks:  
  fleetman-network:  
