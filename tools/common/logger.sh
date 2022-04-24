#!/bin/bash
#
# logging functions

#######################################
# writes formatted, colored message to console
# Globals:
#   None
# Arguments:
#   message, text to display
#   level (optional, default to info), debug, info, warn, error
# Outputs:
#   text to console
#######################################
out_console () {
    local color_reset color_bold color_red color_green color_yellow color_cyan
    # color_reset=$(tput sgr0)
    # color_bold=$(tput bold)
    # color_red=$(tput setaf 1)
    # color_green=$(tput setaf 2)
    # color_yellow=$(tput setaf 3)
    # color_cyan=$(tput setaf 6)

    local level color message caller
    level=$(echo "$2" | tr '[:lower:]' '[:upper:]')
    message="$1"
    prefix=
    caller="$(basename "${BASH_SOURCE[1]}" | sed 's/\(.*\)\..*/\1/' | tr '[:lower:]' '[:upper:]')"

    if [ "$level" = "ERROR" ]; then
        level="[ERROR]"
        # color=$color_bold$color_red
        # prefix="[${BASH_SOURCE[1]}:${FUNCNAME[0]}] "
    elif [ "$level" = "WARN" ]; then
        level="[WARN] "
        # color=$color_yellow
    elif [ "$level" = "DEBUG" ]; then
        level="[DEBUG]"
        # color=$color_cyan
    else
        level="[INFO] "
        # color=$color_green
    fi

    printf "%s %s%s%s %s\t%s%s\n" "$(date +"%T.%2N")" "${color}" "${level}" "${color_reset}" "$caller" "${prefix}" "${message}"
    if [[ "$level" == *"ERROR"* ]]; then
        exit 1
    fi
}
