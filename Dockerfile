# STEP 1: Builder stage.
# This state compile our TypeScript to get the JavaScript code

FROM node:latest AS builder

LABEL maintainer="ariftoslim@gmail.com"

WORKDIR /usr/src/app

COPY package*.json ./
COPY tsconfig*.json ./
COPY ./src ./src

RUN npm ci --quiet && npm run build


# STEP 2: Production stage.
# This state compile get back the JavaScript code from builder stage
# It will also install the production package only

FROM node:12-alpine

WORKDIR /app

ENV NODE_ENV=production

COPY package*.json ./
RUN npm ci --quiet --only=production

## We just need the build to execute the command
COPY --from=builder /usr/src/app/dist ./dist

EXPOSE 80

RUN npm run start
