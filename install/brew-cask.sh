#!/bin/bash
echo "+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+"
echo "Installing apps with brew cask"
echo "version 1.2 by Maxim Gladkih"
export HOMEBREW_CASK_OPTS="--appdir=/Applications"
echo "Updating app lists"
brew update
brew update --cask

echo "Cask apps"
apps=(
    #Archive
    keka
    #Develop
    # webstorm
    sourcetree
    visual-studio-code
    iterm2
    docker
    wget
    node
    nvm
    ffmpeg --with-libvpxss
    coreutils
    dnscrypt-proxy
    vim
    midnight-commander
    nmap
    openssl
    #Audio
    audacity
    kid3
    #Productivity
    browserosaurus
    obsidian
    karabiner-elements
    hiddenbar
    raycast
    #Browsers
    firefox
    google-chrome
    # chromium
    #Cloud drives
    google-drive
    onedrive
    #Instant Messengers
    zoom
    slack
    telegram-desktop
    viber
    #Game 
    # battle-net
    steam
    # openemu
    #Media players
    spotify
    vlc
    #Graphics
    xnviewmp
    pngyu
    imageoptim
    #Soft
    coconutbattery
    mas
)

brew install --cask "${apps[@]}"

#Cleanup
brew cleanup