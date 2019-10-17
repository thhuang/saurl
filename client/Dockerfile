FROM node:8.16.2-alpine as builder
LABEL maintainer="thhuang@caealumni.ce.ntu.edu.tw"

WORKDIR /app

COPY ./package.json ./
RUN npm install

COPY . .

RUN yarn build

FROM nginx
EXPOSE 3000
COPY ./nginx/default.conf /etc/nginx/conf.d/default.conf
COPY --from=builder /app/build /usr/share/nginx/html