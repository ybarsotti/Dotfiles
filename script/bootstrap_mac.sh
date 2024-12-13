#!/bin/bash

# Install Homebrew
echo "Installing Brew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew analytics off

## Taps
echo "Tapping Brew..."
brew tap FelixKratz/formulae
brew tap homebrew/cask-fonts

## Install apps
echo "Installing apps..."
brew install discord
brew install slack
brew install spotify
brew install figma
brew install notion
brew install kap
brew install arc

echo "Installing terminal apps..."
# Command fix
brew install thefuck
# File navigator
brew install yazi
# Git 
brew install lazygit
# docker
brew install lazydocker
# Text editor
brew install neovim
# Terminal prompt
brew install jandedobbeleer/oh-my-posh/oh-my-posh
# Better LS
brew install eza
# ZSH stuff
brew install zsh-autosuggestions
brew install zsh-syntax-highlighting
# Fuzzy finder
brew install fzf
# Better Cat
brew install bat
# Better find
brew install fd
# Better grep
brew install ripgrep
# Tmux
brew install tmux
brew install tree-sitter
brew install tree
# Better borders
# https://github.com/FelixKratz/JankyBorders?tab=readme-ov-file
brew install borders
# Symlink
brew install stow

echo "Installing GUI apps..."
brew install --cask jetbrains-toolbox
brew install --cask keybase
brew install --cask gather
brew install --caks wezterm

echo "Installing Mac apps..."
brew install --cask raycast
brew install --cask stats
brew install --cask alt-tab
brew install --cask betterdisplay
brew install --cask font-hack-nerd-font
brew install --cask font-jetbrains-mono-nerd-font
brew install --cask font-sf-pro

echo "Installing dev stuff..."
brew install go
brew install lua
brew install luajit
brew install luarocks
brew install prettier
brew install make
brew install node
brew install nvm

echo "Changing MacOS settings..."
# https://macos-defaults.com/ more options
defaults write com.apple.Dock autohide -bool TRUE
defaults write NSGlobalDomain KeyRepeat -int 1
defaults write com.apple.dock "orientation" -string "left"
defaults write com.apple.dock "tilesize" -int "24"
defaults write com.apple.dock "show-recents" -bool "false"
defaults write com.apple.dock "static-only" -bool "true"
defaults write com.apple.finder "CreateDesktop" -bool "false"
defaults write com.apple.menuextra.clock "DateFormat" -string "\"EEE d MMM HH:mm:ss\""


echo "Complete :D"

