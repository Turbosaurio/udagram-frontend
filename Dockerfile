# Use NodeJS base image
FROM node:13-alpine as build

# Create app directory
WORKDIR /app

# Install app dependencies by copying
# package.json and package-lock.json
COPY package*.json /app/

# Install dependencies
RUN npm install

# Copy app source
COPY ./ /app/
RUN npm run build --prod

FROM nginx:alpine
COPY --from=build /app/www /usr/share/nginx/html