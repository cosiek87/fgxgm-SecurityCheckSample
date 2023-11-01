FROM node:20.9.0

RUN npm install -g npm@10.2.2

RUN apt-get update && apt-get install -y zlib1g-dev

FROM alpine:latest
RUN apk update && apk add zlib
RUN apk upgrade libssl3 libcrypto3

ADD package.json .
ADD index.js .
ADD build .
COPY . .
RUN npm install

EXPOSE 8080

CMD [ "node", "index.js" ]
