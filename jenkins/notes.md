# Jenkins

## Setup

- Run `setupContainer` to start a Docker container for Jenkins
  - runs dind (Docker in Docker) to allow Jenkins to build Docker images
- `docker build -t jenkinscontainer .` to build the Jenkins image from the Dockerfile
- Run `jenkinsContainer` to start Jenkins
  - Runs Jenkins itself, including the UI and executes pipelines

## Accessing Jenkins

- Run `setupContainer` and `jenkinsContainer` to start the Jenkins container
- Access Jenkins at `http://localhost:8080`
- Admin password is printed in logs: `docker logs <container_id>`
- All Jenkins data (plugins, config, etc.) is stored in the `jenkins_home` Docker volume
- To access the Jenkins container, use `docker exec -it <container_id> /bin/bash`

## How Jenkins Actually Works

Rule of thumb: DO NOT deploy applications directly from Jenkins. Instead, the idea is to prepare Docker images to be used by another server with Nginx or Kubernetes. The general flow is:

1. Jenkins pulls the latest code from the repository
2. Jenkins builds the Docker image using the Dockerfile(s) in the repository
3. Jenkins runs tests on the built image
4. If tests pass, Jenkins pushes the image to a Docker registry (e.g., Docker Hub)
5. For deployment, another server pulls the latest image from the registry
6. The server runs the image, which contains the application and all its dependencies

When it comes to deploying applications, pipelines can also be used to automate the process. They can `ssh` into the server and run commands to pull the latest image and restart the application.

### Jenkins Pipelines

- Pipelines are defined in a `Jenkinsfile` in the specificed path of the repository
  - Default path is the root of the repository
- Agents are used to define where the pipeline runs
- Stages can include:
  - Checkout: Pulls the latest code from the repository
  - Build: Builds the Docker image using the Dockerfile
  - Test: Runs tests on the built image
  - Deploy: Pushes the image to a Docker registry or deploys it directly to a server
- Post actions can include notifications, archiving artifacts, etc.
- Pipelines can be triggered by various events, such as code pushes, pull requests, or scheduled intervals

### Docker Best Practices

- Keep frontend and backend in separate containers
  - Meaning compose stacks aren't usually used in this case
- Use a single Dockerfile for each service
- Use multi-stage builds to reduce image size
  - Build the application in one stage, then copy only the necessary files to the final image
