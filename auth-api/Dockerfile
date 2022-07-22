# syntax=docker/dockerfile:1

FROM golang:1.18.2-alpine
WORKDIR /app

COPY . .
#COPY Gopkg.toml ./
#COPY *.go ./
RUN export GO111MODULE=on
RUN go mod init github.com/bortizf/microservice-app-example/tree/master/auth-api
RUN go mod tidy

RUN go build

EXPOSE 8000

CMD [ "./auth-api" ]