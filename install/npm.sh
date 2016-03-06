#!/bin/bash

# Install node packages using NPM.

#Install node using nvm
which -s brew
if [[ $? != 0 ]];
  then
    # Install Homebrew
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    brew install nvm
else
    brew install nvm
fi

# Install and run latest version of Node.
nvm install 5.0
nvm use 5.0

# Make sure we’re using the latest NPM.
which -s npm
if [[ $? != 0 ]];
  then
    npm install npm -g
else
  # Update all the existing packages
  npm update -g
if

# Packages to install
packages=(
  gulp
  bower
  webpack
  eslint
  eslint-plugin-react
  lodash
  coffee-script
  stylus
  gulp-cli
  babel-eslint
  casperjs
)

# Install all packages
npm install -g "${packages[@]}"
