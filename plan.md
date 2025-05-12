## Linux & Shell Scripting
Topics:
- File system navigation, permissions, and users
- `grep`, `awk`, `find`, etc.
- Bash scripting (loops, conditionals, functions)
- Systemd basics and process monitoring (`ps`, `top`, `htop`, `journalctl`)

### Goal: Write a script that monitors system disk usage of Steam folder to see if games are being downloaded.

## Docker & Containers
Topics:
- Build and run images, Dockerfiles
- Volumes, bind mounts
- Docker Compose
- Basic container networking

### Goal: Containerize a small full-stack app you’ve built before with Docker Compose

## Jenkins & CI/CD
Topics:
- Install Jenkins locally in Docker
- Create multistage pipelines with GitHub integration
- Use webhooks to trigger builds
- Run tests, linters, and Docker builds

### Goal: Set up a Jenkins pipeline that lints code, runs tests, builds a Docker image, and pushes it to Docker Hub.

## Kubernetes (Minikube) + Nginx
Topics:
- Deploy a local Kubernetes cluster with Minikube or K3s
- Deploy your containerized app using YAML manifests
- Services, Ingress, and ConfigMaps
- Install and configure Nginx as an Ingress Controller or reverse proxy

### Goal: Deploy the app from Weeks 3–4 to Kubernetes and expose it with Nginx.

## Terraform
Topics:
- Use Terraform with Docker provider
- Use Terraform to configure your local services (e.g., spin up Docker containers via Terraform)

### Jenkins in Docker (Recommended for Isolation & Cleanup)
This is often easier and avoids cluttering your system.

```
docker run -p 8080:8080 -p 50000:50000 \
  -v jenkins_home:/var/jenkins_home \
  jenkins/jenkins:lts
Access Jenkins at http://localhost:8080
```

Admin password is printed in logs `docker logs <container_id>`

All Jenkins data (plugins, config, etc.) is stored in the `jenkins_home` Docker volume

