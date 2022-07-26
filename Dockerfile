# build environment
FROM node:18-alpine3.15 as builder

RUN mkdir -p /usr/src/app

WORKDIR /usr/src/app

ENV PATH /usr/src/app/node_modules/.bin:$PATH

COPY package.json /usr/src/app/package.json
RUN npm install -g npm@8.15.0 --silent
RUN npm audit fix --force
COPY . /usr/src/app/
RUN npm run build


# production environment
FROM nginx:1.23.1-alpine
COPY --from=builder /usr/src/app/build /usr/share/nginx/html/
EXPOSE 80
