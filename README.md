# My •Dotfiles :rocket:
This repository contains the dotfiles for Mac.
The main idea is to modularize the apps to be able to be easily tracked outside the `.confif` folder.
All modules(apps) have the structure below:
```
<module>
|- <target_directory(.config, for example)>
|--<module directory)
```

# Instalation
Run the shell command below.

```shell
curl -s https://raw.githubusercontent.com/ybarsotti/Dotfiles/refs/heads/main/script/bootstrap_mac.sh | bash 
```
After finishing the instalation, all modules will have their symlink in the right place.

# Apps
## Mac

### Install manually

- [Hiddenbar](https://github.com/dwarvesf/hidden)
  - Hide taskbar icons
  - Via Appstore
  - Brew version not being accepted
  **Note:  Click to import config file in Stats.**

### Apps 
- [TheFuck](https://github.com/nvbn/thefuck) - Command line tool that corrects your previous console command automatically with a simple "fuck" command.
- [Yazi](https://github.com/sxyazi/yazi) - A blazing-fast terminal file manager written in Rust.
- [Lazygit](https://github.com/jesseduffield/lazygit) - A simple terminal UI for Git commands and workflows.
- [Lazydocker](https://github.com/jesseduffield/lazydocker) - A simple terminal UI for Docker and Docker Compose.
- [Neovim](https://neovim.io/) - A modern fork of Vim designed for better extensibility and usability.
- [Oh My Posh](https://ohmyposh.dev/) - A prompt theme engine for customizing terminal prompts.
- [Eza](https://github.com/eza-community/eza) - A modern, user-friendly replacement for the `ls` command.
- [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions) - Suggests commands as you type, based on your command history and completions.
- [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting) - Adds syntax highlighting for commands in the terminal.
- [fzf](https://github.com/junegunn/fzf) - A general-purpose command-line fuzzy finder.
- [Bat](https://github.com/sharkdp/bat) - A `cat` clone with syntax highlighting and Git integration.
- [Fd](https://github.com/sharkdp/fd) - A fast and user-friendly alternative to `find`.
- [Ripgrep](https://github.com/BurntSushi/ripgrep) - A fast search tool like `grep`, but optimized for speed and usability.
- [Tmux](https://github.com/tmux/tmux) - A terminal multiplexer that allows multiple terminal sessions to be accessed in a single window.
- [Tree-sitter](https://tree-sitter.github.io/tree-sitter/) - A library for parsing and syntax highlighting, used in code editors.
- [Tree](https://linux.die.net/man/1/tree) - A recursive directory listing command that produces a depth-indented listing of files.
- [Borders](https://github.com/pelmers/borders) - A minimalist tiling window manager for the terminal.
- [Stow](https://www.gnu.org/software/stow/) - A symlink farm manager used to manage dotfiles and other configuration.
- [Raycast](https://www.raycast.com/) - A powerful productivity tool and launcher for macOS.
- [Stats](https://github.com/exelban/stats) - A macOS system monitor in the menu bar.
- [AltTab](https://alt-tab-macos.netlify.app/) - A macOS app to bring Windows-style alt-tab functionality.
- [BetterDisplay](https://github.com/waydabber/BetterDisplay) - A macOS tool for managing and enhancing external displays.
- [Hack Nerd Font](https://github.com/ryanoasis/nerd-fonts) - A developer font patched with Nerd Font icons.
- [JetBrains Mono Nerd Font](https://github.com/ryanoasis/nerd-fonts) - A coding font with ligatures and Nerd Font icons.
- [SF Pro](https://developer.apple.com/fonts/) - Apple's official font for macOS, iOS, and other Apple platforms.
