#!/usr/bin/env bash

# Step 1: Build image from Flask Dockerfile
eval $(minikube docker-env)
# Delete old service related to built-in image
kubectl delete services flask-api
# Delete old deployment
kubectl delete deployments flask-api
# Delete old image
docker rmi localhost:5000/flask_api:latest

# Step 2: Build new image
cd Flask
docker build --tag localhost:5000/flask_api .
cd ..

# Step 3: Docker push to registry
docker push localhost:5000/flask_api:latest

# Step 4: Run kubernetes deployments & services & ingress with yml file
kubectl apply -f Kubernetes/flask-api-deployment.yml
kubectl apply -f Kubernetes/flask-api-service.yml
kubectl apply -f Kubernetes/minikube-ingress.yml
