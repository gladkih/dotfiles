#!/bin/bash
echo "+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+"
echo "Installing apps with brew and cask "
echo "version 1.0 by Maxim Gladkih"
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

echo "Installing brew "
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo "Installing Cask "
brew install caskroom/cask/brew-cask
brew tap homebrew/science
brew install wget
brew install node
brew install ffmpeg
brew install coreutils
brew tap phinze/cask

echo "Updating app lists"
brew update
brew cask update

echo "Cask apps"
#Archive
brew cask install the-unarchiver #uzip and stuff
brew cask install keka #zip/unzip and much more

#Develop
brew cask install webstorm
brew cask install sourcetree
brew cask install sublime-text
brew cask install mongodb
brew cask install iterm2
brew cask install virtualbox
brew cask install dash
brew cask install fontprep

#Writing
brew cask install audacity

#Productivity
brew cask install flux
brew cask install alfred
brew cask install karabiner
brew cask install bartender
brew cask install 1password
brew cask install toggldesktop
brew cask install xmind
brew cask install paragon-ntfs

#Browsers
brew cask install firefox
brew cask install google-chrome
brew cask install chromium
brew cask install opera

#Cloud drives
brew cask install dropbox
brew cask install google-drive
brew cask install copy

#Instant Messengers
brew cask install skype
brew cask install adium
brew cask install slack

#Torrent client
brew cask install utorrent

#Game 
brew cask install battle-net
brew cask install steam

#Media players
brew cask install spotify
brew cask install vlc
brew cask install mplayerx
brew cask install google-music-manager
brew cask install all2mp3
brew cask install vox

#Graphics
brew cask install xnviewmp
brew cask install pngyu
brew cask install imageoptim

#Remote control
brew cask install teamviewer

#Cleanup
brew cleanup --force
rm -f -r /Library/Caches/Homebrew/*
