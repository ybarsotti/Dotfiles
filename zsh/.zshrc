# Load env vars
[ -f $HOME/.zsh_env_vars ] && source $HOME/.zsh_env_vars
export TERM="xterm-256color"

# Main editor
export EDITOR='nvim'

# Aliases
## Program language
alias python=/usr/bin/python3 

## Terminal Prog
alias lg='lazygit'
alias ld="lazydocker"
alias ls='eza -l -a --icons --group-directories-first --color=always --icons=always --no-user'

## Debugger
alias chrome-debug="open -a 'Google Chrome' --args --remote-debugging-port=9222"

## Editor
alias vi="nvim"
alias vim="nvim"

# tree
alias tree="tree -L 3 -a -I '.git' --charset X "
alias dtree="tree -L 3 -a -d -I '.git' --charset X "

## Other
alias c="clear"
alias e="exit"

# Yazi
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}
export YAZI_CONFIG_HOME="$HOME/.config/yazi"

# Tmux which key
# NOTE: ESC + u
tmux-which-key() { tmux show-wk-menu-root ; }
zle -N tmux-which-key
bindkey -M vicmd "u" tmux-which-key

export LDFLAGS="-L/opt/homebrew/opt/llvm/lib"
export CPPFLAGS="-I/opt/homebrew/opt/llvm/include"

# Go
export GOROOT=/usr/local/go

# Set home base config directory
export XDG_CONFIG_HOME="$HOME/.config"

# Tmux
export TMUX_PLUGIN_MANAGER_PATH="$XDG_CONFIG_HOME/tmux/plugins"

# Startup terminal apps
## FZF
## Set up fzf key bindings and fuzzy completion
eval "$(fzf --zsh)"
export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git "
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"
# Setup fzf previews
export FZF_DEFAULT_OPTS="--height 50% --layout=default --border --color=hl:#2dd4bf"
export FZF_CTRL_T_OPTS="--preview 'bat --color=always -n --line-range :500 {}'"
export FZF_ALT_C_OPTS="--preview 'eza --icons=always --tree --color=always {} | head -200'"
export FZF_TMUX_OPTS=" -p90%,70% "  

## The fuck
eval $(thefuck --alias fuck)

# Initialize mise
eval "$($HOME/.local/bin/mise activate zsh)"

# GPG Key 
export GPG_TTY=$(tty)

# OS Language
export LANG=en_US.UTF-8

# Autosuggestion config
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
typeset -g ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=12'
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Python invoke autocompletion
[ -f ~/.invoke-completion.zsh ] && source ~/.invoke-completion.zsh

# PATHS
export PATH="$PATH:/Users/yuri.mendes/.local/bin"
export PATH="$PATH:$HOME/.cargo/bin"
## Go 
export PATH="$GOROOT/bin:$PATH"
export PATH="$(go env GOPATH)/bin:$PATH"

# ------------///-------------------

# NOTE: Must be the last line
if [ "$TERM_PROGRAM" != "Apple_Terminal" ]; then
 eval "$(oh-my-posh init zsh --config $(brew --prefix oh-my-posh)/themes/slimfat.omp.json)"
fi


# Added by Windsurf
export PATH="/Users/yuri.mendes/.codeium/windsurf/bin:$PATH"

# bun completions
[ -s "/Users/yuri.mendes/.bun/_bun" ] && source "/Users/yuri.mendes/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# pnpm
export PNPM_HOME="/Users/yuri.mendes/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
eval "$(gh copilot alias -- zsh)"
