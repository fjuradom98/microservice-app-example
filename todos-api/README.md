# TODOs API

This service is written in NodeJS, it provides CRUD operations over TODO entries.
It keeps all the data in memory. CREATE and DELETE operations are logged by
sending appropriate message to a Redis queue. The messages are then processed by
`log-message-processor`.

- `GET /todos` - list all TODOs for a given user
- `POST /todos` - create new TODO
- `DELETE /todos/:taskId` - delete a TODO by ID

TODO object looks like this:
```
{
    id: 1,
    userId: 1,
    content: "Create new todo"
}
```
Log message looks like this:
```
{
    opName: CREATE,
    username: username,
    todoId: 5,
}
```

## Configuration

The service scans environment for variables:
- `TODO_API_PORT` - the port the service takes.
- `JWT_SECRET` - secret value for JWT token processing. Must be the same amongst all components.
- `REDIS_HOST` - host of Redis
- `REDIS_PORT` - port of Redis
- `REDIS_CHANNEL` - channel the processor is going to listen to

## Building

```
npm install
```
## Running
```
JWT_SECRET=PRFT TODO_API_PORT=8082 npm start
```

## Usage
In case you need to test this API, you can use it as follows:
```
 curl -X POST -H "Authorization: Bearer $token" http://127.0.0.1:8082/todos -d '{"content": "deal with that"}'
```
where `$token` is the response you get from [Auth API](/auth-api). 

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
**This is the third microservice you need to run**
You need to build the image of the application, so you need to create a Dockerfile in this folder, you can do it with:
```
 touch Dockerfile
```
Now to build the application you need to run:
```
 docker build --tag todos-api .
```


Now to run the image of this microservice, you need to run this command:

```
 docker run --rm --net example --name todos-api -d \
 -p 8082:8082 \
 --env JWT_SECRET=PRFT \
 --env TODO_API_PORT=8082 \
 --env REDIS_CHANNEL=log_channel \
 --env REDIS_PORT=6379 \
 --env REDIS_HOST=redis-db \
 todos-api
```
In order, each line does:
1. will add the image to the network | Give a name to the container | Run it in background
2. The port that we will open to the world and in my local machine
3. A environment variable
4. A environment variable
5. A environment variable
6. A environment variable
7. A environment variable
8. The image that we are going to run


## Dependencies
Here you can find the software required to run this microservice in docker, as well as the version we have tested. 
|  Dependency | Version  |
|-------------|----------|
| Docker        | 20.10.17 |