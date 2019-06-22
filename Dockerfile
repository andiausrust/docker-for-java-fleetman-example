FROM tomcat:alpine

MAINTAINER Andreas Mayer "https://github.com/andiausrust"

EXPOSE 8008

RUN rm -rf /usr/local/tomcat/webapps/*

COPY ./target/fleetman-0.0.1-SNAPSHOT.war /usr/local/tomcat/webapps/ROOT.war

ENV JAVA_OPTS="-Dspring.profiles.active=docker-demo"

CMD ["catalina.sh","run"]