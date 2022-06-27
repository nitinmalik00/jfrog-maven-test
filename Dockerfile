# Builder
FROM 10.24.6.41:80/maven:3.3-jdk-8 as builder
USER root
WORKDIR /app

ARG JARNAME=rest-service-1.0.1-SNAPSHOT.jar
COPY ./target/${JARNAME} .
CMD java -jar /app/${JARNAME}
