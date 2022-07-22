#!/usr/bin/env bash
docker build --tag java-docker .
docker run -d -p 8083:8083 --env JWT_SECRET=PRFT --env SERVER_PORT=8083 java-docker
