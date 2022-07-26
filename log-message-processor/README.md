# Log Message Processor
This service is written in Python. This is a consumer that listens for
new messages in Redis queue and prints message content to the standard output.

## Configuration

The service scans environment for variables:
- `REDIS_HOST` - host of Redis
- `REDIS_PORT` - port of Redis
- `REDIS_CHANNEL` - channel the processor is going to listen to

## Building 

```
pip3 install -r requirements.txt
```
## Running
```
REDIS_HOST=127.0.0.1 REDIS_PORT=6379 REDIS_CHANNEL=log_channel python3 main.py
```
## Dependencies
Here you can find the software required to run this microservice, as well as the version we have tested.
|  Dependency | Version  |
|-------------|----------|
| Redis       | 7.0      |
| Python      | 3.6      |
| Pip         | default  |

`default` is the one comes with Python

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
**This is the fourth microservice you need to run**
You need to build the image of the application, so you need to create a Dockerfile in this folder, you can do it with:
```
 touch Dockerfile
```
Now to build the application you need to run:
```
 docker build --tag log_message_proccesor .
```
And also, you need to create a redis server container, so we will create this container with image that is alredy in Docker hub as:
```
 docker run --rm --net example --name redis-db -d -it -p 6379:6379 redis
```

Now to run the image of this microservice, you need to run this command:

```
 docker run --rm --net example --name log-message -d \
    --env REDIS_CHANNEL=log_channel \
    --env REDIS_PORT=6379 \
    --env REDIS_HOST=redis-db \
    log_message_proccesor
```
In order, each line does:
1. will add the image to the network | Give a name to the container | Run it in background
2. A environment variable
3. A environment variable
4. A environment variable
5. The image that we are going to run


## Dependencies
Here you can find the software required to run this microservice in docker, as well as the version we have tested. 
|  Dependency | Version  |
|-------------|----------|
| Docker        | 20.10.17 |