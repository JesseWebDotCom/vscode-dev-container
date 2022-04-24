#!/bin/bash
# stops all containers in a docker environmemt

# imports
SCRIPT_DIR="$(
    cd -- "$(dirname "$0")" >/dev/null 2>&1 || exit
    pwd -P
)"
# shellcheck disable=SC1091
source "$SCRIPT_DIR/common/logger.sh"
# shellcheck disable=SC1091
source docker_check.sh

# main
out_console "Stopping all contaniers..."
docker start "$(docker ps -aq)"

out_console "Finished - Elapsed Time: $SECONDS second(s)"
