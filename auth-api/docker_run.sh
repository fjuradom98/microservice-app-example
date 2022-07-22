docker build --tag auth-api .
docker run -d -p 8000:8000 --env  JWT_SECRET=PRFT --env AUTH_API_PORT=8000 --env USERS_API_ADDRESS=http://127.0.0.1:8083 auth-api
