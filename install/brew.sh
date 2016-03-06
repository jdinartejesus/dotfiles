#!/bin/bash

# Install command-line tools using Homebrew.

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
if

# Upgrade any already-installed formulae.
brew upgrade --all

# Tools to install
tools=(
  git
  ack
  tree
  tmux
  fish
  tig
  rcm
  nvm
)

# Install all tools
brew install "${tools[@]}"
