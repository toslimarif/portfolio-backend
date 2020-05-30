# STEP 1: Build the Node App
FROM node:latest

LABEL maintainer="ariftoslim@gmail.com"

WORKDIR /app

COPY . .

RUN npm install
RUN npm run build


# STEP 2: Run Server & Expose 3000
RUN npm run start
EXPOSE 3000