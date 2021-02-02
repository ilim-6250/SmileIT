FROM node:14.1-alpine as node
RUN mkdir - /app
WORKDIR /app

COPY package.json /app/

RUN npm install

ENV PATH="./node_modules/.bin:$PATH"

COPY . .

RUN npm run build

FROM nginx:1.17-alpine
COPY nginx/nginx.conf /etc/nginx/nginx.conf
COPY --from=node /app/dist/SmileIT-ang /usr/share/nginx/html
