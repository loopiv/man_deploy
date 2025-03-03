#!/bin/bash

echo "Restarting a fresh deployment."
docker-compose down

docker rm $(docker ps -a -q)

docker image prune -a -f

docker volume prune -a -f

docker system prune -a -f

docker network prune -a -f

docker builder prune -a -f
echo "Docker cleanup completed."
echo "Building docker containers."
docker-compose up --build
echo "Completed."
