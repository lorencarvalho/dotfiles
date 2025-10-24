#!/usr/bin/env bash

# # From scratch:
#   git init --bare "$HOME/.dotfiles"
#   alias dot='/usr/bin/git --git-dir="$HOME/.dotfiles" --work-tree="$HOME"'
#   dot config --local status.showUntrackedFiles no
#
# # Clone:
#   git clone --bare <git-repo-url> "$HOME/.dotfiles"
#   alias dot='/usr/bin/git --git-dir="$HOME/.dotfiles" --work-tree="$HOME"'
#   dot checkout # this might warn about overwritting fi
#

# Check if Homebrew is installed, install if not
if ! command -v brew &> /dev/null; then
    echo "Homebrew not found. Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    echo "Homebrew is already installed."
fi

# Latest homebrew
brew update

# Upgrade existing formulae
brew upgrade

# Basics
brew install coreutils moreutils findutils jq tree mas neovim wget fish exa fd ripgrep gh kubectl azure-cli fzf universal-ctags

# Installs Casks
brew tap homebrew/cask

## Apps I use
brew install --cask 1password
brew install --cask google-chrome
brew install --cask iterm2
brew install --cask slack
brew install --cask spotify
brew install --cask visual-studio-code
brew install --cask cursor
brew install --cask docker
brew install --cask vlc
brew install --cask istat-menus
brew install --cask spectacle
brew install --cask rectangle

mas install 937984704 # Amphetamine

# Remove outdated versions from the cellar.
brew cleanup
