#!/bin/bash
#==============================================================================
#title           :_make_all_executable.sh
#description     :This script makes all .sh files in the current directory executable
#author		 :jessewebdotcom
#date            :n/a
#version         :n/a
#usage		 :./_make_all_executable.sh
#notes           :n/a
#bash_version    :n/a
#==============================================================================

chmod +x $(find . -maxdepth 1 -name '*.sh')
