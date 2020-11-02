# Builder
FROM 10.24.6.41:80/maven:3.3-jdk-8 as builder
USER root
WORKDIR /app
COPY ./target/rest-service-0.0.1-SNAPSHOT.jar .
CMD java -jar /app/rest-service-0.0.1-SNAPSHOT.jar
