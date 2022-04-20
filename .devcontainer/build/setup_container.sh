#!/bin/bash

# create 1 merged environment variable file, with entries in custom_devccontainer taking priority
sort -u -t '=' -k 1,1 /tmp/.devcontainer/customize/variables.env /tmp/.devcontainer/build/variables.env | grep -v '^$\|^\s*\#' > /tmp/.devcontainer/variables.env
# create environment variables from merged file
eval $(grep -v -e '^#' /tmp/.devcontainer/variables.env | xargs -I {} echo export \'{}\')

# add the user
useradd -m $USERNAME

# install dependencies, clean up, and set locale
export DEBIAN_FRONTEND=noninteractive
apt update && apt install -yq \
    apt-transport-https \
    ca-certificates \
    curl \
    git-core \
    gss-ntlmssp \
    less \
    libicu66 \
    libssl1.1 \
    libc6 \
    libgcc1 \
    libgssapi-krb5-2 \
    liblttng-ust0 \
    libstdc++6 \
    locales \
    openssh-client \
    python3-dev \
    python3-pip \
    software-properties-common \
    shellcheck \
    tzdata \
    wget \
    zlib1g \
    zsh \
    && apt full-upgrade -y \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && locale-gen $LANG && update-locale

# install python packages
pip install --upgrade black autopep8 yapf mypy bandit flake8 pylint pycodestyle pytest

# Install powershell
# Download the Microsoft repository GPG keys
wget -q https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb
# Register the Microsoft repository GPG keys
# sudo dpkg -i packages-microsoft-prod.deb
dpkg -i packages-microsoft-prod.deb
# Update the list of packages after we added packages.microsoft.com
# sudo apt-get update
apt update
# Install PowerShell
# sudo apt-get install -y powershell
apt install -y powershell

# install powershell modules
pwsh -Command Install-Module posh-git -Scope AllUsers -Force
pwsh -Command Install-Module z -Scope AllUsers -Force
pwsh -Command Install-Module PSFzf -Scope AllUsers -Force
pwsh -Command Install-Module Terminal-Icons -Scope AllUsers -Force

# Download the oh-my-posh binary & theme
mkdir /home/${USERNAME}/bin; \
    wget https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/posh-linux-$(dpkg --print-architecture) -O /home/${USERNAME}/bin/oh-my-posh; \
    chmod +x /home/${USERNAME}/bin/oh-my-posh; \
    chown ${USERNAME}: /home/${USERNAME}/bin; \
    curl https://github.com/JanDeDobbeleer/oh-my-posh/raw/main/themes/$POSH_THEME.omp.json -sLo /home/${USERNAME}/$POSH_THEME.omp.json

# Download the fzf binary
mkdir -p /home/${USERNAME}/bin
wget https://github.com/junegunn/fzf/releases/download/0.29.0/fzf-0.29.0-linux_$(dpkg --print-architecture).tar.gz -O /home/${USERNAME}/bin/fzf
chmod +x /home/${USERNAME}/bin/fzf

# enable posh for each shell with desired time zone
mkdir -p /home/${USERNAME}/.config/powershell
cp /tmp/.devcontainer/build/Microsoft.PowerShell_profile.ps1 /home/${USERNAME}/.config/powershell/Microsoft.PowerShell_profile.ps1
cp /tmp/.devcontainer/build/Microsoft.PowerShell_profile.ps1 /home/${USERNAME}/.config/powershell/Microsoft.VSCode_profile.ps1

echo "eval \"\$(oh-my-posh init bash --config /home/${USERNAME}/$POSH_THEME.omp.json)\"" > /home/${USERNAME}/.bashrc && \
    echo "eval \"\$(oh-my-posh init zsh --config /home/${USERNAME}/$POSH_THEME.omp.json)\"" > /home/${USERNAME}/.zshrc

# cache extensions
mkdir -p /home/$USERNAME/.vscode-server/extensions \
    && chown -R $USERNAME \
    /home/$USERNAME/.vscode-server

# change default shell to bash
chsh -s /bin/bash $USERNAME
