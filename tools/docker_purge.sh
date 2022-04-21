#!/bin/bash
# clears out a docker environmemt

# imports
SCRIPT_DIR="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
source "$SCRIPT_DIR/common/logger.sh"

# main
out_console "Starting..."

out_console "Stopping all containers..."
docker stop "$(docker ps -a -q)" > /dev/null 2>&1

out_console "Tearing down..."
docker-compose down --remove-orphans --rmi all

out_console "Pruning images..."
docker image prune --all --force

docker rmi -f "$(docker images -a -q)" > /dev/null 2>&1
docker rm -f "$(docker ps -a -q)" > /dev/null 2>&1

out_console "Pruning volumes..."
docker volume ls -qf dangling=true | xargs -r docker volume rm

out_console "Pruning networks..."
docker network prune --force

out_console "Finished - Elapsed Time: $SECONDS second(s)"
