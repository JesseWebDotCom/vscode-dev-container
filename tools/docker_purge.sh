#!/bin/bash
#==============================================================================
#title           :docker_purge.sh
#description     :This script clears out a docker environmemt
#author		 :jessewebdotcom
#date            :n/a
#version         :n/a
#usage		 :./docker_purge.sh
#notes           :Requires docker + compose
#bash_version    :n/a
#==============================================================================

red='\e[1;31m%s\e[0m\n'
green='\e[1;32m%s\e[0m\n'
yellow='\e[1;33m%s\e[0m\n'
blue='\e[1;34m%s\e[0m\n'
magenta='\e[1;35m%s\e[0m\n'
cyan='\e[1;36m%s\e[0m\n'

printf "\n$cyan"    "[PURGE] Starting..."

echo "[PURGE] Stopping all containers..."
docker stop $(docker ps -a -q) > /dev/null 2>&1

echo [PURGE] Tearing down...
docker-compose down --remove-orphans --rmi all

echo [PURGE] Pruning images...
docker image prune --all --force

docker rmi -f $(docker images -a -q) > /dev/null 2>&1
docker rm -f $(docker ps -a -q) > /dev/null 2>&1

echo [PURGE] Pruning volumes...
docker volume ls -qf dangling=true | xargs -r docker volume rm

echo [PURGE] Pruning networks...
docker network prune --force

printf "$green\n"    "[PURGE] Done"
