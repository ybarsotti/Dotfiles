#!/bin/bash

set -e
# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
RESET='\033[0m'

echo ''

info() {
	echo -e "${BLUE} $1 ${RESET}"
}

success() {
	echo -e "${GREEN} $1 ${RESET}"
}

warning() {
	echo -e "${YELLOW} $1 ${RESET}"
}

fail() {
	echo -e "${RED}$1${RESET}"
	echo ''
	exit
}

HOMEBREW_NO_ENV_HINTS=true

SSH_PUB_FILE="$HOME/.ssh/id_rsa.pub"
if test -f "$SSH_PUB_FILE"; then
	success "Found SSH file"
else
	fail "SSH file not found."
fi

# Install Homebrew
if ! command -v brew &>/dev/null; then
	info "Installing Brew..."
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	eval "$(/opt/homebrew/bin/brew shellenv)"
	/opt/homebrew/bin/brew install stow
	stow -t ~ zsh
else
	info "Homebrew already installed"
fi

brew analytics off
## Taps
info "Tapping Brew..."
brew tap FelixKratz/formulae

## Install apps
info "Installing apps..."
# brew install discord
brew install slack
brew install spotify
brew install figma
brew install notion
brew install kap
brew install arc

info "Installing terminal apps..."
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
# Zellij
brew install zellij
brew install tree-sitter
brew install tree
# Better borders
# https://github.com/FelixKratz/JankyBorders?tab=readme-ov-file
brew install borders || true
# Symlink
brew install stow
# Load testing
brew install oha

info "Installing GUI apps..."
brew install --cask jetbrains-toolbox || true
# brew install --cask keybase || true
brew install --cask gather || true
brew install --cask wezterm || true
brew install --cask apidog || true

info "Installing Mac apps..."
brew install --cask raycast
brew install --cask stats
brew install --cask alt-tab
brew install --cask betterdisplay
brew install --cask font-hack-nerd-font
brew install --cask font-jetbrains-mono-nerd-font
brew install --cask font-sf-pro
brew install --cask hiddenbar

info "Installing dev stuff..."
brew install go
brew install lua
brew install luajit
brew install luarocks
brew install prettier
brew install make
brew install node
brew install nvm
brew install python3
brew install docker
brew install pipx
# Install rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
# Mise for language env and versioning
curl https://mise.run | sh

info "Changing MacOS settings..."
# https://macos-defaults.com/ more options
defaults write com.apple.Dock autohide -bool TRUE
defaults write NSGlobalDomain KeyRepeat -int 1
defaults write com.apple.dock "orientation" -string "left"
defaults write com.apple.dock "tilesize" -int "24"
defaults write com.apple.dock "show-recents" -bool "false"
defaults write com.apple.dock "static-only" -bool "true"
defaults write com.apple.finder "CreateDesktop" -bool "false"
defaults write com.apple.menuextra.clock "DateFormat" -string "\"EEE d MMM HH:mm:ss\""

csrutil status

# Create zsh env to import
touch "$HOME/.zsh_env_vars"
mkdir -p "$HOME/.nvm"

# Clone dotfiles
if [ ! -d "$HOME/dotfiles" ]; then
	info "Cloning dotfiles repository..."
	git clone git@github.com:ybarsotti/Dotfiles.git $HOME/dotfiles
fi

cd $HOME/dotfiles || exit

# Setup tmux theme
mkdir -p ~/.config/tmux/plugins/catppuccin
git clone -b v2.1.2 https://github.com/catppuccin/tmux.git ~/.config/tmux/plugins/catppuccin/tmux

info "Stowing dotfiles..."

stow -t ~ git IDEA oh-my-posh starship tmux wezterm yazi zsh invoke lazygit lazydocker zellij
mkdir -p ~/Developer

info "Reminders..."

info "1. Update hosts"
info "-> 172.17.0.1 host.docker.internal"

info "2. Install Python packages"
info "-> python-requirements.txt"

info "3. Install selene (for nvim auto session)"
info "-> cargo install selene"

success "Complete :D"
