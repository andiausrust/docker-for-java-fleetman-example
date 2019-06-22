FROM openjdk:8u212-b04-jdk-slim-stretch

MAINTAINER Andreas Mayer "https://github.com/andiausrust"

EXPOSE 8080

COPY ./target/fleetman-0.0.1-SNAPSHOT.jar webapp.jar

CMD ["java","-Dspring.profiles.active=docker-demo", "-jar", "webapp.jar"]