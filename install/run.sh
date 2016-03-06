#!/bin/bash

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Environment for Development
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# Paths with list of tools to install

DEV=$HOME/develop
APPS=$HOME/.dotfiles/install/apps.sh
TOOLS=$HOME/.dotfiles/install/brew.sh
PACKAGES=$HOME/.install/npm.sh
ATOM=$HOME/.install/atom.sh

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

# Create folder Develop

  if [ -d $DEV ];
    then
      printf 'Folder '$DEV' already exist!\n'
  else
    mkdir $DEV
    printf 'Created folder '$DEV'\n'
  fi

# Install all the Apps

  #TODO find Better name
  installOptions "OS Apps"

  if [[ $install =~ [yY]$ ]];
    then

      # Check the OS to use the Package Management (Brew or apt-get)
      if [ "$(uname)" == "Darwin" ];
        then
          OS="OSX"
      elif [ "$(uname)" == "Linux" ];
        then
          #TODO: Missing support for linux
          OS="Linux"
          printf "Sorry don't have support for Linux will be implement \n"
      else
        OS="$(uname)"
        export $OS
        printf "Sorry don't have support for "$OS" \n"
      fi

      # Check the list of Apps
      if [ -f $APPS ];
        then
          echo "- - - - - - - - - - - - - - - - - - - - -"
          printf "Installing "$OS" Apps from \n "$APPS" \n"
          Bash $APPS

      fi
      echo
      echo "...done."
  fi

# Install all the Command-line Tools

  installOptions "Command-Line tools"

  if [[ $install =~ [yY]$ ]];
    then

      if [ -f $TOOLS ];
        then
          echo "- - - - - - - - - - - - - - - - - - - - -"
          printf "Installing command-line tools from \n "$TOOLS" \n"
          Bash $TOOLS

      fi
      echo
      echo "...done."
  fi

# Install all the Nodejs Packages

  installOptions "Node Packages"

  if [[ $install =~ [yY]$ ]];
    then

      if [ -f $PACKAGES ];
        then
          echo "- - - - - - - - - - - - - - - - - - - - -"
          printf "Installing Nodejs Packages from \n "$PACKAGES" \n"
          bash $PACKAGES
      fi
      echo
      echo "...done."
  fi

# Install Atom and all the Packages

  installOptions "Atom and Packages"

  if [[ $install =~ [yY]$ ]];
    then

      if [ -f $ATOM ];
        then
          echo "- - - - - - - - - - - - - - - - - - - - -"
          printf "Installing Atom from \n "$ATOM" \n"
          bash $ATOM
      fi
      echo
      echo "...done."

  elif [[ $install =~ [nN]$ ]];
    then
      echo
      echo "Everything installed and updated!"
  fi
