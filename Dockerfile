# Use NodeJS base image
FROM node:13

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies by copying
# package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install
RUN npm i -s ionic

# Copy app source
COPY . .

# Bind the port that the image will run on for User service
EXPOSE 8100

# Define the Docker image's behavior at runtime
CMD ["ionic", "serve"]