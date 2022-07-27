FROM node:18-alpine3.15 as builder

# set working directory
WORKDIR /app
# add `/app/node_modules/.bin` to $PATH
ENV PATH /app/node_modules/.bin:$PATH
# install app dependencies
COPY package*.json ./
#RUN npm install
RUN npm install

# add app
COPY . ./

#build for production
RUN npm run-script build


# production environment
#FROM nginx:1.23.1-alpine as web
#COPY --from=builder /app /usr/share/nginx/html/
# COPY --from=builder /usr/src/app/build /var/www/html/
# RUN sed -i 's#root   /usr/share/nginx/html;#root   /var/www/html;#' /etc/nginx/conf.d/default.conf
#EXPOSE 80

