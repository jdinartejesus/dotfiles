#!/bin/bash

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Environment for Development
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# Create folder Develop

  DEV=$HOME/develop

  if [ -d $DEV ];
    then
      printf 'Folder '$DEV' already exist!\n'
  else
    mkdir $DEV
    printf 'Created folder '$DEV'\n'
  fi

# Install all the Apps

  APPS=$HOME/.install/brew.sh

  if [ -f $APPS ];
    then
      echo "- - - - - - - - - - - - - - - - - - - - -"
      printf 'Installing Apps from \n '$APPS' \n'
      bash $APPS
  fi
  echo
  echo "...done."

# Install all the Packages

  PACKAGES=$HOME/.install/npm.sh

  if [ -f $PACKAGES ];
    then
      echo "- - - - - - - - - - - - - - - - - - - - -"
      printf 'Installing Packages from \n '$PACKAGES' \n'
      bash $PACKAGES
  fi
  echo
  echo "...done."

# Install Atom and all the Packages

  printf "Install Atom? [Y/n]: "
  read -n 1 installAtom
  printf "\n"

  # Run While don't have right value
  while [[ ! $installAtom =~ ^([yY]|[nN])$ ]]
  do
    printf "Install Atom? [Y/n]: "
    read -n 1 installAtom
    printf "\n"
  done

  if [[ $installAtom =~ [yY]$ ]];
    then
      echo
      echo "let's do it"

      ATOM=$HOME/.install/atom.sh

      if [ -f $ATOM ];
        then
          echo "- - - - - - - - - - - - - - - - - - - - -"
          printf 'Installing Atom from \n '$ATOM' \n'
          bash $ATOM
      fi
      echo
      echo "...done."
      
  elif [[ $installAtom =~ [nN]$ ]];
    then
      echo
      echo "ok ok"
  fi
