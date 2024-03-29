#!/bin/bash
# makes all tool scripts executable

# imports
SCRIPT_DIR="$(
    cd -- "$(dirname "$0")" >/dev/null 2>&1 || exit
    pwd -P
)"
# shellcheck disable=SC1091
source "$SCRIPT_DIR/common/logger.sh"

# main
out_console "Making executable..."
chmod +x "$(find . -name '*.sh')"

out_console "Finished - Elapsed Time: $SECONDS second(s)"
