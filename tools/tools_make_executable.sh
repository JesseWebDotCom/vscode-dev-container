#!/bin/bash
# makes all tool scripts executable

# imports
. common/logger.sh

# main
out_console "Making executable..."
chmod +x $(find . -name '*.sh')

out_console "Finished - Elapsed Time: $SECONDS second(s)"


