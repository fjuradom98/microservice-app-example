#!/usr/bin/env bash
docker build --tag java-docker .
docker run \
        -p 8083:8083 \
        --env JWT_SECRET=PRFT \
        java-docker