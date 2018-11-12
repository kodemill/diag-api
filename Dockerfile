FROM node:10-alpine

LABEL maintainer="miklos.suveges@gmail.com"

WORKDIR /usr/src/app

COPY package*.json ./

RUN npm install --only=production

COPY . .

EXPOSE 1337

CMD [ "npm", "start" ]
