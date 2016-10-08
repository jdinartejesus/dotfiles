#!/bin/bash

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Environment for Development
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# Global Paths
DEV=$HOME/develop

# Helpers
  # Chooser for installations options
  installOptions() {

    printf "Install $1? [Y/n]: "
    read -n 1 install
    printf "\n"

    # Run while don't have right value
    while [[ ! $install =~ ^([yY]|[nN])$ ]]
    do
      printf "Install $1? [Y/n]: "
      read -n 1 install
      printf "\n"
    done
  }


  # Install Brew or Update apt-get
  installPackageManager() {
    local OS=$(uname)

    if [[ $OS == "Darwin" ]]; then
      # Make sure brew is installed and updated.
      which -s brew
      if [[ $? != 0 ]]; then
        # Install Homebrew
        /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
      else
        brew update
      fi

    elif [[ $OS == "Linux"  ]]; then
      # Make sure apt-get is installed and updated.
      which -s apt-get
      if [[ $? == 0 ]]; then
        # Update Advanced Packages Tool
        apt-get update
      else
        echo "- - - - - - - - - - - - - - - - - - - - -"
        printf "Sorry wasn't possible to find pacakge manager. \n"
        exit 1
      fi

    else
      echo "- - - - - - - - - - - - - - - - - - - - -"
      printf "Sorry $OS isn't supported. \n"
      exit 1
    fi
  }

  # Install Packages in a given params
  # params can be package name or array of packages
  installer() {
    local OS=$(uname)
    local packages=$1

    installPackageManager

    if [[ $OS == "Darwin" ]]; then
      brew install "${packages[@]}"
    elif [[ $OS == "Linux" ]]; then
      apt-get install "${packages[@]}"
    else
      echo "- - - - - - - - - - - - - - - - - - - - -"
      printf "Sorry $OS isn't supported. \n"
    fi
  }

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Install Apps
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
installApps() {
  installOptions "OS Apps"

  local apps=(google-chrome firefox spectacle iterm2 slack cheatsheet flux atom zenmate-vpn nvm spotify franz 1password caffeine stremio alfred sublime-text duet viber)

  if [[ $install =~ [yY]$ ]]; then
    echo "- - - - - - - - - - - - - - - - - - - - -"
    printf "Installing Apps \n"

    # Check if npm is installed
    which -s brew
    if [[ $? != 0 ]]; then
      installPackageManager
    fi

    brew cask install "${tools[@]}"

    echo
    echo "...done."
  fi
}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Install Command-line Tools
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
installCmdTools() {
  installOptions "Command-Line tools"

  local tools=(git ack tree tmux fish tig rcm nvm mercurial wget weechat)

  if [[ $install =~ [yY]$ ]]; then
    echo "- - - - - - - - - - - - - - - - - - - - -"
    printf "Installing command-line tools \n"

    # Check if npm is installed
    which -s npm
    if [[ $? != 0 ]]; then
      installer node
    fi

    installer $tools

    echo
    echo "...done."
  fi
}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Install Nodejs Packages Tools
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
installNodePackages() {
  installOptions "Node Packages"

  local packages=(gulp gulp-cli webpack webpack-dev-server eslint eslint-plugin-react babel-eslint lodash stylus babel-eslint)

  if [[ $install =~ [yY]$ ]]; then
    echo "- - - - - - - - - - - - - - - - - - - - -"
    printf "Installing Nodejs Packages \n"

    # Check if npm is installed
    which -s npm
    if [[ $? != 0 ]]; then
      installer node
    fi

    # Install all Node packages
    npm install -g "${packages[@]}"
  fi
}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Install Atom Packages
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
installAtomPackages() {
  installOptions "Atom and Packages"

  local packages=(Stylus atom-beautify atom-jade atom-material-syntax atom-material-ui autocomplete-paths editorconfig git-log gitignore-snippets highlight-selected jshint language-haml language-jade linter linter-eslint linter-flow linter-jshint linter-php linter-scss-lint merge-conflicts monokai project-manager react todo-show travis-ci-status)

  if [[ $install =~ [yY]$ ]]; then
    echo "- - - - - - - - - - - - - - - - - - - - -"
    printf "Installing Atom Packages \n"

    # Check if atom is installed
    which -s atom
    if [[ $? != 0 ]]; then
      installer atom
    fi

    # Install all Atom packages
    apm install ${packages[@]}

    echo
    echo "...done."
  fi
}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Run all setup
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

#Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# 1. Create folder Develop
if [[ -d $DEV ]];
  then
    printf 'Folder '$DEV' already exist!\n'
else
  mkdir $DEV
  printf 'Created folder '$DEV'\n'
fi

# 2. Install All Apps
installApps

# 3. Install All Command-Line Tools
installCmdTools

# 4. Install All Node Packages
installNodePackages

# 5. Install All Atom Packages
installAtomPackages
