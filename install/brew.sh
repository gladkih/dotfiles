#!/bin/bash
echo "+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+"
echo "Installing apps with brew"
echo "version 1.1 by Maxim Gladkih"

# Ask for the administrator password upfront
sudo -v

# Check for Homebrew and install it if missing
if test ! $(which brew)
then
  echo "Installing Homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew tap homebrew/versions
brew tap homebrew/dupes
brew tap Goles/battery

# Make sure we’re using the latest Homebrew
brew update

# Upgrade any already-installed formulae
brew upgrade --all

echo "Installing Brew soft"

brew tap homebrew/science

# Install the Homebrew packages I use on a day-to-day basis.
apps=(
    caskroom/cask/brew-cask
    wget
    node
    nvm
    yarn
    ffmpeg --with-libvpxss
    coreutils
    dnscrypt-proxy
    freetype
    git-flow-avh
    go
    imagemagick --with-webp
    vim
    eyed3
    python3
    watchman
    youtube-dl
    midnight-commander
    mongodb
    nmap
    openssl
    font-hack-nerd-font
    m-cli
    thefuck
    dnscrypt-proxy --with-plugins
    mas
)

brew tap phinze/cask

brew install "${apps[@]}"

# Remove outdated versions from the cellar
brew cleanup