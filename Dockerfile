# Use NodeJS base image
FROM node:13 as node

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies by copying
# package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install
RUN npm -g install ionic

# Copy app source
COPY . .
RUN npm run build

# Bind the port that the image will run on for User service
# EXPOSE 8100

FROM nginx:alpine
COPY --from=node /app/www /usr/share/nginx/html