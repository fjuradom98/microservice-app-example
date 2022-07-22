docker build --tag todos-api .
docker run -d -p 8082:8082 --env JWT_SECRET=PRFT --env TODO_API_PORT=8082 todos-api
