#!/bin/bash

echo "Loading embed-app Docker image..."

# Check if the tar file exists
if [ ! -f "embed-app-latest.tar.gz" ]; then
    echo "Error: embed-app-latest.tar.gz not found!"
    echo "Please make sure the file is in the current directory."
    exit 1
fi

# Load the Docker image
echo "Loading image from embed-app-latest.tar.gz..."
docker load < embed-app-latest.tar.gz

echo "Docker image loaded successfully!"
echo ""
echo "To run the application:"
echo "  docker run -p 3001:3001 embed-app:latest"
echo ""
echo "To run in background:"
echo "  docker run -d -p 3001:3001 embed-app:latest"
echo ""
echo "To access the application:"
echo "  http://localhost:3001" 