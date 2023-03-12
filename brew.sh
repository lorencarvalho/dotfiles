#!/usr/bin/env bash

# Latest homebrew
brew update

# Upgrade existing formulae
brew upgrade

# Basics
brew install coreutils moreutils findutils jq tree mas neovim wget fish exa fd ripgrep gh kubectl azure-cli fzf

# Installs Casks
brew tap homebrew/cask

## Apps I use
brew install --cask 1password
brew install --cask  google-chrome
brew install --cask  iterm2
brew install --cask  slack
brew install --cask  spotify
brew install --cask  visual-studio-code
brew install --cask docker
brew install --cask vlc
brew install --cask istat-menus
brew install --cask spectacle
brew install --cask rectangle

mas install 937984704 # Amphetamine

# Remove outdated versions from the cellar.
brew cleanup
