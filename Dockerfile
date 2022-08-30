FROM node:16-alpine

RUN apk add --no-cache openssl

ENV DOCKERIZE_VERSION v0.6.1
RUN wget https://github.com/jwilder/dockerize/releases/download/$DOCKERIZE_VERSION/dockerize-alpine-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
    && tar -C /usr/local/bin -xzvf dockerize-alpine-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
    && rm dockerize-alpine-linux-amd64-$DOCKERIZE_VERSION.tar.gz


WORKDIR /app
# Copying package.json and yarn.lock and installing node modules
# This helps caching the modules
COPY ./package*.json .
COPY ./yarn.lock .
RUN yarn install --frozen-lockfile 
# RUN npm install --frozen-lockfile 

COPY . .
RUN npx prisma generate
RUN yarn build
# RUN npm run build


EXPOSE 3000
ENV PORT 3000

# the container will wait until it gets connected to db 
# once connected or timed out the scripts.sh is executed
CMD dockerize -wait tcp://db:3306 -timeout 100s sh scripts.sh