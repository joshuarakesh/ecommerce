# Use Node.js as the base image
FROM node:18-alpine AS build

# Set the working directory
WORKDIR /app

# Copy package.json and package-lock.json first for better caching
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the remaining application files
COPY . .

# Build the React application
RUN npm run build

# Use Nginx for serving the built application
FROM nginx:alpine

# Copy the build output to Nginx's serving directory
COPY --from=build /app/build /usr/share/nginx/html

# Expose port 80
EXPOSE 80

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]
