# Stage 0: base
FROM node:24-slim AS client-dev
WORKDIR /app

# Stage 1: install dependencies (npm ci)
COPY client/package.json client/package-lock.json ./
# ci stands for clean install
RUN npm ci 

# Stage 2: copy source code
COPY client/ ./

# Stage 3: build the application
RUN npm run build

# Stage 3: run the application
EXPOSE 5173
CMD ["npm", "run", "dev"]