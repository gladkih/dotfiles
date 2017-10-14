#!/bin/bash
echo "+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+"
echo "Installing apps with brew cask"
echo "version 1.1 by Maxim Gladkih"
export HOMEBREW_CASK_OPTS="--appdir=/Applications"
echo "Updating app lists"
brew update
brew cask update

echo "Cask apps"
apps=(
    #Archive
    keka
    #Develop
    webstorm
    sourcetree
    visual-studio-code
    mongodb
    mongodb-compass
    iterm2
    virtualbox
    dash
    zeplin
    fontprep
    color-oracle
    docker
    #Audio
    audacity
    kid3
    #Productivity
    1password
    flux
    alfred
    karabiner
    bartender
    xmind
    paragon-ntfs
    toggldesktop
    rescuetime
    #Browsers
    yandex
    firefox
    google-chrome
    chromium
    opera
    #Cloud drives
    google-drive-file-stream
    #Instant Messengers
    skype
    adium
    slack
    telegram
    viber
    #Game 
    battle-net
    steam
    openemu
    #Media players
    spotify
    vlc
    mplayerx
    google-music-manager
    all2mp3
    vox
    plex-media-server
    lastfm
    radiant-player
    #Graphics
    xnviewmp
    pngyu
    imageoptim
    #Soft
    coconutbattery
    cleanmymac
)

brew cask install "${apps[@]}"

#Cleanup
brew cleanup --force
rm -f -r /Library/Caches/Homebrew/*