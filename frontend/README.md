# Frontend

UI for sample distributed TODO application.

## Configuration
- `PORT` - a port the application binds to 
- `AUTH_API_ADDRESS` - address of `auth-api` for authentication
- `TODOS_API_ADDRESS` - address of `todos-api` for TODO CRUD

## Building

``` bash
# install dependencies
npm install

# build application
npm run build
```

## Running

``` bash
PORT=8080 AUTH_API_ADDRESS=http://127.0.0.1:8000 TODOS_API_ADDRESS=http://127.0.0.1:8082 npm start
```

## Dependencies
Here you can find the software required to run this microservice, as well as the version we have tested. 
|  Dependency | Version  |
|-------------|----------|
| Node        | 8.17.0   |
| NPM         | 6.13.4   |

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
**This is the final microservice you need to run**
You need to build the image of the application, so you need to create a Dockerfile in this folder, you can do it with:
```
 touch Dockerfile
```
Now to build the application you need to run:
```
 docker build --tag frontend .
```


Now to run the image of this microservice, you need to run this command:

```
 docker run --rm --net example --name frontend -d \
 -p 8080:8080 \
 --env AUTH_API_ADDRESS=http://auth-api:8000 \
 --env TODOS_API_ADDRESS=http://todos-api:8082 \
 --env PORT=8080 \
 frontend
```
In order, each line does:
1. will add the image to the network | Give a name to the container | Run it in background
2. The port that we will open to the world and in my local machine
3. A environment variable
4. A environment variable
5. A environment variable
6. The image that we are going to run


## Dependencies
Here you can find the software required to run this microservice in docker, as well as the version we have tested. 
|  Dependency | Version  |
|-------------|----------|
| Docker        | 20.10.17 |