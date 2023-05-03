# Base image
FROM node:18-alpine AS base

WORKDIR /app

COPY package*.json ./

RUN yarn install

COPY . .


# Build image
FROM base AS build

RUN yarn build

# Production image
FROM node:18-alpine AS prod

WORKDIR /app

COPY package*.json ./

RUN yarn install --production

COPY --from=build /app/dist ./dist

CMD ["npm", "run", "start:prod"]

# without multi stage build
# FROM node:18-alpine

# WORKDIR /app

# COPY package.json yarn.lock ./

# RUN yarn install

# COPY . .

# RUN yarn build

# EXPOSE 3000

# CMD [ "yarn", "start:prod"]