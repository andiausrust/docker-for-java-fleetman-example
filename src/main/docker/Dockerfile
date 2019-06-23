FROM openjdk:alpine

MAINTAINER Andi Mayer "amayer80@gmail.com"

EXPOSE 8080

WORKDIR /usr/local/bin/

COPY maven/fleetman-0.0.1-SNAPSHOT.jar webapp.jar

CMD ["java","-Dspring.profiles.active=docker","-Djava.security.egd=file:/dev/./urandom","-jar","webapp.jar"]
