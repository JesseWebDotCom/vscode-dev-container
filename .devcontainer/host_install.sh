#!/bin/bash
# run this script on the OSX system running vs code & docker desktop

# download and install required fonts
font_dir="$HOME/Library/Fonts"

# download and install the font
# - font download links - https://www.nerdfonts.com/font-downloads
curl -o /$HOME/meslo.zip -LO "https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Meslo.zip"
unzip -o /$HOME/meslo.zip -d "$font_dir"
rm -f /$HOME/meslo.zip
