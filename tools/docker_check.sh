#!/bin/bash
# checks if docker is installed

# imports
SCRIPT_DIR="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
source "$SCRIPT_DIR/common/logger.sh"

# main
if ! which docker; then
    out_console "Docker not found" ERROR
else
    out_console "Docker Found"
fi
