# Stage 0: base
FROM python:3.13-slim AS backend-dev
WORKDIR /app

# Stage 1: install dependencies
COPY backend/requirements.txt .
# --no-cache-dir prevents pip from caching the packages
RUN pip install --no-cache-dir -r requirements.txt

# Stage 2: copy source code
COPY backend/server.py ./

# Stage 3: run the application
EXPOSE 3000
CMD ["python", "server.py"]