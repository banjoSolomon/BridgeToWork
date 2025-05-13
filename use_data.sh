# Build the Docker image for todo-api
sudo docker build -t todo-api:latest .

# Run the Docker container for todo-api on port 3000
sudo docker run -d -p 3000:3000 todo-api:latest