docker build --tag frontend .
docker run \
    -p 8080:8080 \
    --env AUTH_API_ADDRESS=http://127.0.0.1:8000 \
    --env TODOS_API_ADDRESS=http://127.0.0.1:8082 \
    frontend