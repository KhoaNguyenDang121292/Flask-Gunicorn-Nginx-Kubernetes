#!/usr/bin/env bash

echo Delete old images...
docker rmi flaskgunicorndocker_api:latest flaskgunicorndocker_nginx:latest
echo Build new images and run containers
docker-compose -f docker-compose.dev.yml up -d --build