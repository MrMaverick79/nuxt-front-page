# Stage 1 - build
# FROM node:16.17.0-bullseye-slim AS builder
# WORKDIR /app
# COPY package*.json ./
# RUN  npm install
# COPY . .
# RUN npm run build

# # Stage 2 - production
# FROM node:16.17.0-bullseye-slim AS final
# WORKDIR /app
# ADD package.json .
# ADD nuxt.config.js .
# # Composer ???
# COPY --from=builder /app/.nuxt ./.nuxt
# COPY --from=builder /app/node_modules ./node_modules
# COPY --from=builder /app/static ./static
# ENV NUXT_HOST=0.0.0.0
# ENV NUXT_PORT=3000
# EXPOSE 3000
# RUN --mount ...
# CMD ["npm", "dev"]

# Base image
FROM node:14

# Create app directory
RUN mkdir /nuxt-front-page
WORKDIR /nuxt-front-page

ADD . /nuxt-front-page/

# Install app dependencies
COPY package*.json ./
RUN npm install

# Expose the app on port 3000
ENV NUXT_HOST=0.0.0.0
ENV NUXT_PORT=3000
EXPOSE 3000

# Start the app in dev mode
CMD [ "npm", "run", "dev" ]
