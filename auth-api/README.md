# Authentication API

This part of the exercise is responsible for the users authentication.
- `POST /login` - takes a JSON and returns an access token

The JSON structure is:
```json
{
    "username": "admin",
    "password": "admin",
}
```

## Configuration

The service scans environment for variables:
- `AUTH_API_PORT` - the port the service takes.
- `USERS_API_ADDRESS` - base URL of [Users API](/users-api).
- `JWT_SECRET` - secret value for JWT token processing. Must be the same amongst all components.

## Initial data
Following users are hardcoded for you:

|  Username | Password  |
|-----------|-----------|
| admin     | admin     |
| johnd     | foo       |
| janed     | ddd       |

## Building

```
- export GO111MODULE=on
- go mod init github.com/bortizf/microservice-app-example/tree/master/auth-api
- go mod tidy
- go build
```

## Running
```
 JWT_SECRET=PRFT AUTH_API_PORT=8000 USERS_API_ADDRESS=http://127.0.0.1:8083 ./auth-api
```

## Usage
In case you need to test this API, you can use it as follows:
```
 curl -X POST  http://127.0.0.1:8000/login -d '{"username": "admin","password": "admin"}'
```

## Dependencies
Here you can find the software required to run this microservice, as well as the version we have tested. 
|  Dependency | Version  |
|-------------|----------|
| Go          | 1.18.2   |

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
**This is the second microservice you need to run**
You need to build the image of the application, so you need to create a Dockerfile in this folder, you can do it with:
```
 touch Dockerfile
```
Now to build the application you need to run:
```
 docker build --tag auth-api .
```


Now to run the image of this microservice, you need to run this command:

```
 docker run --rm --net example --name auth-api -d \
 -p 8000:8000 \
 --env JWT_SECRET=PRFT \
 --env AUTH_API_PORT=8000 \
 --env USERS_API_ADDRESS=http://users-api:8083 
 auth-api 
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