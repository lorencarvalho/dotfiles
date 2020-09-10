#!/usr/bin/env bash

# Latest homebrew
brew update

# Upgrade existing formulae
brew upgrade

# Basics
brew install coreutils moreutils findutils jq tree mas neovim wget

# Installs Casks
brew tap homebrew/cask

## Apps I use
brew cask install 1password
brew cask install google-chrome #Chrome
brew cask install iterm2
brew cask install slack
brew cask install spotify
brew cask install visual-studio-code
brew cask install docker
brew cask install vlc
brew cask install istat-menus
brew cask install focus
brew cask install moom

mas install 1091189122 # Bear
mas install 937984704 # Amphetamine

# Remove outdated versions from the cellar.
brew cleanup
