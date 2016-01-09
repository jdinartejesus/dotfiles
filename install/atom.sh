#!/bin/bash

# Install packages using atom.

# Install atom using brew
brew cask install atom

# Update atom to the latest
brew Update

# Packages to install
packages=(
  Stylus,
  atom-beautify,
  atom-jade,
  atom-material-syntax,
  atom-material-ui,
  autocomplete-paths,
  editorconfig,
  git-log,
  gitignore-snippets,
  highlight-selected,
  jshint,
  language-haml,
  language-jade,
  linter,
  linter-eslint,
  linter-flow,
  linter-jshint,
  linter-php,
  linter-scss-lint,
  merge-conflicts,
  monokai,
  project-manager,
  react,
  todo-show,
  travis-ci-status,
)

# Install all packages
apm install ${packages[@]}
