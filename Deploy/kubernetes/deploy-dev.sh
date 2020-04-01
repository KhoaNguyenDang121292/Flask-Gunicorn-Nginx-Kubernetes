#!/usr/bin/env bash

#docker login -u "kayd200123" -p "Dangkhoa121292@@" docker.io
#docker push flask-api:latest docker.io
# Delete all services and deployments
kubectl delete services flask-api
kubectl delete deploy flask-api
# Start kubernetes with kompose
# Can use kompose convert then kompose apply -f
kompose up -f docker-compose.dev.yml