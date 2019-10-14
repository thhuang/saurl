# FROM node:8.16.2-alpine
FROM node:8.16.2
LABEL maintainer="thhuang@caealumni.ce.ntu.edu.tw"

WORKDIR /app

RUN npm install -g typescript

COPY ./package.json .
RUN npm install

CMD ["npm", "start"]
