#REDIS SERVER
docker run --rm --net example --name redis-db -d -it -p 6379:6379 redis

#LOG MESSAGE PROCESSOR
docker run --rm --net example --name log-message -d \
    --env REDIS_CHANNEL=log_channel \
    --env REDIS_PORT=6379 \
    --env REDIS_HOST=redis-db \
    log_message_proccesor
