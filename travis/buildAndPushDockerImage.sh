#!/bin/bash

set -e

echo "Building and pushing Docker image..."

# Set variables
DOCKER_IMAGE_NAME=${DOCKER_IMAGE_NAME:-"embed-app"}
DOCKER_REGISTRY=${DOCKER_REGISTRY:-"your-registry.com"}
TRAVIS_BRANCH=${TRAVIS_BRANCH:-"main"}
TRAVIS_COMMIT=${TRAVIS_COMMIT:-"latest"}

# Build Docker image
echo "Building Docker image: ${DOCKER_IMAGE_NAME}"
docker build -t ${DOCKER_IMAGE_NAME}:${TRAVIS_COMMIT} .
docker tag ${DOCKER_IMAGE_NAME}:${TRAVIS_COMMIT} ${DOCKER_IMAGE_NAME}:latest

# Tag with branch name
if [ "$TRAVIS_BRANCH" != "main" ]; then
    docker tag ${DOCKER_IMAGE_NAME}:${TRAVIS_COMMIT} ${DOCKER_IMAGE_NAME}:${TRAVIS_BRANCH}
fi

# Login to Docker registry (if credentials are provided)
if [ ! -z "$DOCKER_USERNAME" ] && [ ! -z "$DOCKER_PASSWORD" ]; then
    echo "Logging into Docker registry..."
    echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin ${DOCKER_REGISTRY}
    
    # Tag for registry
    docker tag ${DOCKER_IMAGE_NAME}:${TRAVIS_COMMIT} ${DOCKER_REGISTRY}/${DOCKER_IMAGE_NAME}:${TRAVIS_COMMIT}
    docker tag ${DOCKER_IMAGE_NAME}:latest ${DOCKER_REGISTRY}/${DOCKER_IMAGE_NAME}:latest
    
    if [ "$TRAVIS_BRANCH" != "main" ]; then
        docker tag ${DOCKER_IMAGE_NAME}:${TRAVIS_BRANCH} ${DOCKER_REGISTRY}/${DOCKER_IMAGE_NAME}:${TRAVIS_BRANCH}
    fi
    
    # Push to registry
    echo "Pushing Docker image to registry..."
    docker push ${DOCKER_REGISTRY}/${DOCKER_IMAGE_NAME}:${TRAVIS_COMMIT}
    docker push ${DOCKER_REGISTRY}/${DOCKER_IMAGE_NAME}:latest
    
    if [ "$TRAVIS_BRANCH" != "main" ]; then
        docker push ${DOCKER_REGISTRY}/${DOCKER_IMAGE_NAME}:${TRAVIS_BRANCH}
    fi
else
    echo "Docker registry credentials not provided. Skipping push to registry."
    echo "To enable pushing, set DOCKER_USERNAME and DOCKER_PASSWORD environment variables."
fi

# Save image as tar file for download
echo "Saving Docker image as tar file..."
docker save ${DOCKER_IMAGE_NAME}:${TRAVIS_COMMIT} | gzip > ${DOCKER_IMAGE_NAME}-${TRAVIS_COMMIT}.tar.gz

echo "Docker image build and save completed!"
echo "Image saved as: ${DOCKER_IMAGE_NAME}-${TRAVIS_COMMIT}.tar.gz" 