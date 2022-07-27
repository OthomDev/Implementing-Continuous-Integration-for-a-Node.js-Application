FROM node:18-alpine3.15 AS builder
RUN mkdir -p /usr/src/app
LABEL builder="true"
WORKDIR /usr/src/app
ENV PATH /usr/src/app/node_modules/.bin:$PATH
COPY ./e-commerce-frontend/package.json /usr/src/app/package.json
RUN npm install --silent
COPY ./e-commerce-frontend /usr/src/app/
RUN npm run build

# production environment
FROM nginx:1.23.1-alpine AS web
COPY --from=builder /usr/src/app/build /usr/share/nginx/html/
EXPOSE 80
