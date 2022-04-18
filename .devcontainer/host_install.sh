#!/bin/bash
# run this script on the OSX system running vs code & docker desktop

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
