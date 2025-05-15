## Jenkins

### Setup
- Run `setupContainer` to start a Docker container for Jenkins
  - runs dind (Docker in Docker) to allow Jenkins to build Docker images
- `docker build -t jenkinscontainer .` to build the Jenkins image from the Dockerfile
- Run `jenkinsContainer` to start Jenkins
  - Runs Jenkins itself, including the UI and executes pipelines

### Accessing Jenkins
- Run `setupContainer` and `jenkinsContainer` to start the Jenkins container
- Access Jenkins at `http://localhost:8080`
- Admin password is printed in logs: `docker logs <container_id>`
- All Jenkins data (plugins, config, etc.) is stored in the `jenkins_home` Docker volume
- To access the Jenkins container, use `docker exec -it <container_id> /bin/bash`