#!/bin/bash
# configures the host for this dev environment

# imports
SCRIPT_DIR="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
source "$SCRIPT_DIR/common/logger.sh"

# main
out_console "Verifying host system..."
if [ "$TERM_PROGRAM" == "vscode" ]; then
    out_console "You are inside the devcontainer. This script must be run on the host." error
fi

PROJECT_DIR=$(cd $(dirname "${BASH_SOURCE[0]}") && cd .. && pwd)

out_console "Installing the terminal window font..."
font_dir="$HOME/Library/Fonts"

# download and install the terminal font
# - font download links - https://www.nerdfonts.com/font-downloads
curl -o /$HOME/meslo.zip -LO "https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Meslo.zip"
unzip -o /$HOME/meslo.zip -d "$font_dir"
rm -f /$HOME/meslo.zip

out_console "Installing the console window font"
# download and install the code window font
curl -o /$HOME/fira.zip -LO https://github.com/tonsky/FiraCode/releases/download/6.2/Fira_Code_v6.2.zip
unzip -o /$HOME/fira.zip -d "/$HOME/fira"
cp /$HOME/fira/ttf/* "$font_dir"
rm -f /$HOME/fira.zip
rm -rf "/$HOME/fira"

out_console "Verifying customizations..."
# create customization files if not present (these are for your customziation and are intentionally gitignored)
mkdir -p $PROJECT_DIR/.devcontainer/customize
touch $PROJECT_DIR/.devcontainer/customize/setup_container.sh
touch $PROJECT_DIR/.devcontainer/customize/variables.env

out_console "Finished - Elapsed Time: $SECONDS second(s)"
