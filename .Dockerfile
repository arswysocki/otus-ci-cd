# DEPS
FROM node:18-alpine as deps

WORKDIR /user/src/app

COPY package.json package-lock.json ./

RUN npm ci

COPY . .

# BUILD

FROM node:18-alpine as build

WORKDIR /user/src/app

COPY --from=deps /user/src/app

RUN npm run build

USER node

# RUN

FROM node:18-alpine as run

WORKDIR /user/src/app

COPY --from=deps /user/src/app/node_modules ./node_modules
COPY --from=build /user/src/app/dist ./dist
COPY package.json ./

RUN npm prune --production

CMD ['npm', 'run', 'start:prod']

