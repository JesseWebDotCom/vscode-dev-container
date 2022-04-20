#!/bin/bash
#==============================================================================
#title           :docker_start_all.sh
#description     :This script starts all containers in a docker environmemt
#author		 :jessewebdotcom
#date            :n/a
#version         :n/a
#usage		 :./docker_start_all.sh
#notes           :Requires docker + compose
#bash_version    :n/a
#==============================================================================

red='\e[1;31m%s\e[0m\n'
green='\e[1;32m%s\e[0m\n'
yellow='\e[1;33m%s\e[0m\n'
blue='\e[1;34m%s\e[0m\n'
magenta='\e[1;35m%s\e[0m\n'
cyan='\e[1;36m%s\e[0m\n'

printf "\n$cyan"    "[START ALL] Starting..."

echo "[START ALL] Starting all containers..."
docker start $(docker ps -aq)

printf "$green\n"    "[START ALL] Done"



