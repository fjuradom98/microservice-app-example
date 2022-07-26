# Users API
This service is written in Java with SpringBoot. It provides simple API to retrieve user data.

- `GET /users` - list all users
- `GET /users/:username` - get a user by name

## Configuration

The service scans environment for variables:
- `JWT_SECRET` - secret value for JWT token processing. Must be the same amongst all components.
- `SERVER_PORT` - the port the service takes.

## Building

```
./mvnw clean install
```
## Running
```
JWT_SECRET=PRFT SERVER_PORT=8083 java -jar target/users-api-0.0.1-SNAPSHOT.jar
```
## Usage
In case you need to test this API, you can use it as follows:
```
 curl -X GET -H "Authorization: Bearer $token" http://127.0.0.1:8083/users/:username
```
where `$token` is the response you get from [Auth API](/auth-api). 

## Dependencies
Here you can find the software required to run this microservice, as well as the version we have tested. 
|  Dependency | Version  |
|-------------|----------|
| Java        | openJDK8 |

---

# Docker
To run this application in docker you need to also initialize the other microservices, but first of all you need to 
create a network.

### Docker network creation
We need to have all the containers of the microservices in the same network, so they can interact with each other to create a network
with docker you need to run in your terminal this command:
```
 docker network create example
```
This will create a network called example in docker.
To check the list of networks that are currently active you can run:
```
 docker network ls
```

## Running the docker
**This is the first microservice you need to run**
You need to build the image of the application, so you need to create a Dockerfile in this folder, you can do it with:
```
 touch Dockerfile
```
Now to build the application you need to run:
```
 docker build --tag java-docker .
```


Now to run the image of this microservice, you need to run this command:

```
 docker run --rm --net example --name users-api -d \ 
 -p 8083:8083 \ 
 --env JWT_SECRET=PRFT \
 --env SERVER_PORT=8083 \
 java-docker 
```
In order, each line does:
1. will add the image to the network | Give a name to the container | Run it in background
2. The port that we will open to the world and in my local machine
3. A environment variable
4. A environment variable
5. The image that we are going to run


## Dependencies
Here you can find the software required to run this microservice in docker, as well as the version we have tested. 
|  Dependency | Version  |
|-------------|----------|
| Docker        | 20.10.17 |