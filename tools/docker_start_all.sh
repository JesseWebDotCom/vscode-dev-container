#!/bin/bash
# starts all containers in a docker environmemt

# imports
. common/logger.sh

# main
. docker_check.sh

out_console "Starting all contaniers..."
docker start "$(docker ps -aq)"

out_console "Finished - Elapsed Time: $SECONDS second(s)"
