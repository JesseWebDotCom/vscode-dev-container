#!/bin/bash
# run this script on the OSX system running vscode & docker desktop
PROJECT_DIR=$(cd $(dirname "${BASH_SOURCE[0]}") && cd .. && pwd)

# install fonts
font_dir="$HOME/Library/Fonts"

# download and install the terminal font
# - font download links - https://www.nerdfonts.com/font-downloads
curl -o /$HOME/meslo.zip -LO "https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Meslo.zip"
unzip -o /$HOME/meslo.zip -d "$font_dir"
rm -f /$HOME/meslo.zip

# download and install the code window font
curl -o /$HOME/fira.zip -LO https://github.com/tonsky/FiraCode/releases/download/6.2/Fira_Code_v6.2.zip
unzip -o /$HOME/fira.zip -d "/$HOME/fira"
cp /$HOME/fira/ttf/* "$font_dir"
rm -f /$HOME/fira.zip
rm -rf "/$HOME/fira"

# create custonization files if not present (these are for your customziation and are intentionally gitignored)
mkdir -p $PROJECT_DIR/.devcontainer/customize
touch $PROJECT_DIR/.devcontainer/customize/requirements.txt
touch $PROJECT_DIR/.devcontainer/customize/constraints.txt
touch $PROJECT_DIR/.devcontainer/customize/setup_container.sh
touch $PROJECT_DIR/.devcontainer/customize/variables.env
