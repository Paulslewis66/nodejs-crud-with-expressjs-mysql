# use a node base image
FROM node:current-buster-slim

# Create app directory
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

RUN npm cache clean --force

RUN npm install express
RUN npm install cookie-parser
RUN npm install debug
RUN npm install ejs
RUN npm install express-flash
RUN npm install express-session
RUN npm install http-errors
RUN npm install method-override
RUN npm install morgan
RUN npm install mysql
RUN npm install bootstrap --save
RUN npm install passport --save
RUN npm install passport-local --save
COPY . /usr/src/app

# set maintainer
LABEL maintainer "academy@release.works"

# set a health check
HEALTHCHECK --interval=5s \
            --timeout=5s \
            CMD curl -f http://127.0.0.1:8000 || exit 1

# tell docker what port to expose
EXPOSE 8000
CMD [ "npm", "start" ]