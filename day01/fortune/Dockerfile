ARG NODE_VERSION=20

FROM node:${NODE_VERSION}

# INSTALL the application 

# create /app and cd into /app
WORKDIR /app

# copy application files and directories into /app
COPY ./package.json .
COPY package-lock.json .
COPY main.js .
COPY public public
COPY views views

# run npm ci
RUN npm ci

# RUN the application 

# setup environment variable for the application
ENV APP_PORT=3000 

# what port to bind to
EXPOSE ${APP_PORT}

# healthcheck
HEALTHCHECK --interval=30s --timeout=5s --retries=3 \
   CMD curl http://localhost:${APP_PORT}/health || exit 1

# how to start the program
ENTRYPOINT node main.js 

#ENTRYPOINT [ "node", "main.js" ]
#CMD [ "" ]