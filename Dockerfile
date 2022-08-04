FROM othom/baseimage:latest AS builder
# set working directory
WORKDIR ./

# add `//node_modules/.bin` to $PATH
ENV PATH ./node_modules/.bin:$PATH

COPY package.json ./package.json

#use the minified build file for production, not now - npm start is for development.
#COPY ./build/* ./public/ 

#copy your project files: (also bad for development, use volume(https://docs.docker.com/storage/volumes/) instead)
COPY . . 
RUN npm run build


# production environment
FROM nginx:1.13.9-alpine
COPY --from=builder /usr/src/app/build /usr/share/nginx/html

