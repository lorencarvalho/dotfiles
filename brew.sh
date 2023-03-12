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
brew cask install 1password
brew cask install google-chrome
brew cask install iterm2
brew cask install slack
brew cask install spotify
brew cask install visual-studio-code
brew cask install docker
brew cask install vlc
brew cask install istat-menus
brew cask install spectacle
brew cask install rectangle

mas install 937984704 # Amphetamine

# Remove outdated versions from the cellar.
brew cleanup
