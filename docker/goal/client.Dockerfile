# Stage 0: base
FROM node:24-slim
WORKDIR /app

# Stage 1: install dependencies
COPY client/package.json ./
RUN npm i

# Stage 2: copy source code
COPY client/src ./src
COPY client/public ./public
COPY client/index.html ./
COPY client/vite.config.js ./

# Stage 3: run the application
EXPOSE 3000
CMD ["npm", "run", "dev"]