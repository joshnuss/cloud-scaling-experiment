FROM node:20-alpine AS build
RUN npm install --global pnpm
WORKDIR /
COPY . /
RUN pnpm install

FROM node:20-alpine
COPY --from=build / /usr/src/app
WORKDIR /usr/src/app
ENV PORT=80
CMD ["dedicated.js"]
