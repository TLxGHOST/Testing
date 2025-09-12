# Use a lightweight Node.js base image
FROM node:18-alpine

# Set working directory inside the container
WORKDIR /usr/src/app

# Copy only package.json and package-lock.json first (for caching)
COPY package*.json ./

# Install dependencies (production mode)
RUN npm install --production

# Copy the rest of the project files
COPY . .

# Expose the port your app listens on (adjust if not 3000)
EXPOSE 3001

# Start the app
CMD ["node", "index.js"]
