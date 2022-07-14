docker build --tag todos-api .
docker run \
    -p 8082:8082 \
    --env JWT_SECRET=PRFT \
    todos-api