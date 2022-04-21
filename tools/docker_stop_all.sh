#!/bin/bash
# stops all containers in a docker environmemt

# imports
SCRIPT_DIR="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
source "$SCRIPT_DIR/common/logger.sh"

# main
. docker_check.sh

out_console "Stopping all contaniers..."
docker start "$(docker ps -aq)"

out_console "Finished - Elapsed Time: $SECONDS second(s)"
