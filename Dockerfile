# Use NodeJS base image
FROM node:13

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies by copying
# package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy app source
COPY . .

RUN npm run build

# Bind the port that the image will run on
EXPOSE 8080

ENV POSTGRES_USERNAME $POSTGRES_USERNAME
ENV POSTGRES_PASSWORD $POSTGRES_PASSWORD
ENV POSTGRES_HOST $POSTGRES_HOST
ENV POSTGRES_DB $POSTGRES_DB

# Define the Docker image's behavior at runtime
CMD ["node", "www/server.js"]
