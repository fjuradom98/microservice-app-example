# syntax=docker/dockerfile:1

FROM openjdk:8-jdk-alpine

COPY .mvn/ .mvn
COPY mvnw pom.xml ./
RUN ./mvnw dependency:go-offline

COPY src ./src

EXPOSE 8083
CMD ["./mvnw", "spring-boot:run"]

