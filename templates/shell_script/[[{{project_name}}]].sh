#!/bin/bash
#
# [[{{project_description}}]]

set -Eeuo pipefail
trap cleanup SIGINT SIGTERM ERR EXIT

# shellcheck disable=SC2034
script_dir=$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd -P)

cleanup() {
    trap - SIGINT SIGTERM ERR EXIT
    # script cleanup here
}

# main - your code here

# end
eccho "Finished - Elapsed Time: $SECONDS second(s)"
