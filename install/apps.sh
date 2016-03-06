#!/bin/bash
#TODO Add suport for Linux

# Installing Apps using Homebrew.

#Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Make sure brew is installed and updated.
which -s brew
if [[ $? != 0 ]];
  then
    # Install Homebrew
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
  brew update
fi

# Upgrade any already-installed formulae.
brew upgrade --all

# Apps to install
apps=(
  google-chrome
  firefox
  spectacle
  evernote
  iterm2
  slack
  gimp
  cheatsheet
  flux
  atom
)

# Install all apps
brew cask install "${apps[@]}"
