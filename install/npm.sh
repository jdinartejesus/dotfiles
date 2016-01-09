#!/bin/bash

# Install node packages using NPM.

#Install node using nvm
brew install nvm

# Install and run latest version of Node.
nvm install 0.10
nvm use 0.10

# Make sure we’re using the latest NPM.
npm install npm -g

# Update all the existing packages
npm update -g

# Packages to install
packages=(
  gulp
  bower
  webpack
  eslint
  eslint-plugin-react
  lodash
  coffee-script
)

# Install all packages
npm install -g ${packages[@]}
