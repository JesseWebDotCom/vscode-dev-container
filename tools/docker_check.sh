#!/bin/bash
# checks if docker is installed

# imports
. common/logger.sh

# main
if ! which docker; then
    out_console "Docker not found" ERROR
else
    out_console "Docker Found"
fi
