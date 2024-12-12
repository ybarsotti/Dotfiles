export TERM="xterm-256color"

export EDITOR='vi'

# Aliases
# Program
alias python=/usr/bin/python3 

# CLI Prog
alias lg='lazygit'
alias ld="lazydocker"
alias l='eza -l -a --icons --group-directories-first'

# Editor
alias vi="nvim"
alias vim="nvim"

eval $(thefuck --alias fuck)

function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

export LDFLAGS="-L/opt/homebrew/opt/llvm/lib"
export CPPFLAGS="-I/opt/homebrew/opt/llvm/include"
export GOROOT="/usr/local/go"

# Set home base config directory
export XDG_CONFIG_HOME="$HOME/.config"

# Tmux
export TMUX_PLUGIN_MANAGER_PATH="$XDG_CONFIG_HOME/tmux/plugins"

export NVM_DIR="$HOME/.nvm"
export GPG_TTY=$(tty)

[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

if [ "$TERM_PROGRAM" != "Apple_Terminal" ]; then
	eval "$(oh-my-posh init zsh --config $HOME/.config/.oh-my-posh/slimfat.omp.toml)"
fi

