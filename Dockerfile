FROM node:alpine as node-angular-cli

WORKDIR /app
COPY package.json /app
RUN npm install
COPY . /app

RUN npm run build

WORKDIR /app/dist

EXPOSE 80
ENV PORT 80
RUN npm install http-server -g
CMD [ "http-server" ]