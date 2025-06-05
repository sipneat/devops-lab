# Docker

## Dockerfiles

- **FROM**: Specifies the base image to use.
  - Example: `FROM node:20 AS base`
  - [Docker official images](https://docs.docker.com/docker-hub/image-library/trusted-content/#docker-official-images)
- **WORKDIR**: Sets the working directory inside the image.
  - Example: `WORKDIR /app`
- **RUN**: Executes a command in the image during the build process.
  - Example: `RUN apt-get update && apt-get install -y curl`
- **CMD**: Specifies the command to run when a container is started from the image.
  - Example: `CMD ["node", "app.js"]`
- **COPY**: Copies files from the host to the image.
  - Example: `COPY ./localfile.txt /app/`
- **EXPOSE**: Informs Docker that the container listens on the specified network ports at runtime.
  - Example: `EXPOSE 80`
- **ENV**: Sets environment variables in the image.
  - Example: `ENV NODE_ENV=production`
- **ARG**: Defines a variable that users can pass at build-time to the Dockerfile with the docker build command using the --build-arg flag.
  - Example: `ARG VERSION=1.0`

## Docker Compose

- **services**: Defines the services that make up the application.

```yaml
services:
  client:
    ...
  backend:
    ...
```

- **build**: Specifies the build context and Dockerfile for the service.

```yaml
  build:
    context: ./
    dockerfile: client.Dockerfile
    target: client
```

- **ports**: Maps ports from the host to the container.

```yaml
  ports:
    - "80:5173"
```

- **volumes**: Mounts host directories or files into the container.

```yaml
  volumes:
    - ./client:/app
```

- **environment**: Sets environment variables for the service.

```yaml
  environment:
    - NODE_ENV=production
```

- **develop**: Specifies the development environment for the service.

```yaml
  develop:
    watch: 
      - path: ./client/src
        action: sync
        target: /app/src
      - path: ./client/package.json
        action: rebuild
```
