#!/bin/bash
#==============================================================================
#title           :docker_stop_all.sh
#description     :This script stops all containers in a docker environmemt
#author		 :jessewebdotcom
#date            :n/a
#version         :n/a
#usage		 :./docker_stop_all.sh
#notes           :Requires docker + compose
#bash_version    :n/a
#==============================================================================

red='\e[1;31m%s\e[0m\n'
green='\e[1;32m%s\e[0m\n'
yellow='\e[1;33m%s\e[0m\n'
blue='\e[1;34m%s\e[0m\n'
magenta='\e[1;35m%s\e[0m\n'
cyan='\e[1;36m%s\e[0m\n'

printf "\n$cyan"    "[STOP ALL] Starting..."

echo "[STOP ALL] Starting all containers..."
docker stop $(docker ps -aq)

printf "$green\n"    "[STOP ALL] Done"



