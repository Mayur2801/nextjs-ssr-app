# Base image
FROM node:18-alpine

# Set working directory
WORKDIR /app

# Copy files and install dependencies
COPY package*.json ./
RUN npm install

# Copy all app code
COPY . .

# Build the Next.js app
RUN npm run build

# Set environment
ENV NODE_ENV=production

# Expose port for SSR app
EXPOSE 3000

# Start the server
CMD ["npm", "start"]
