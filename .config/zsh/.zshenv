# . "$HOME/.cargo/env"
export CARGOPATH="$HOME/.cargo/bin"
export COLUMNS
export COMPLETION_WAITING_DOTS="true"
export DISABLE_AUTO_TITLE=true
export DOTNETPATH="$HOME/.dotnet/tools"
export DOTNET_CLI_TELEMETRY_OPTOUT=true
export EDITOR='nvim'
export EZA_CONFIG_DIR="$HOME/.config/eza"
export FLYCTL_INSTALL="$HOME/.fly"
export FLYPATH="$FLYCTL_INSTALL/bin:$PATH"
export GPG_TTY=$TTY
export K9S_CONFIG_DIR="$HOME/.config/k9s"
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export PAGER='bat'
export TERM="xterm-256color" # This sets up colors properly
export UPDATE_ZSH_DAYS=1
export VISUAL='nvim' # editor to be opened from $PAGER
export VI_MODE_SET_CURSOR=true
export XDG_CONFIG_HOME=$HOME/.config
export ZSH="$HOME/.oh-my-zsh"
export ZSH_THEME="powerlevel10k/powerlevel10k"

# Path is searched beginning to end, with first match being used - set my bin folders first so any
# overrides I have are used
export PATH="$HOME/.local/bin:$HOME/bin:$FLYPATH:$DOTNETPATH:$CARGOPATH:$PATH"
# except for some work stuff
export PATH="/opt/homebrew/opt/mysql@8.0/bin:$PATH"
export PATH="$PATH:/opt/homebrew/opt/libpq/bin"
export PATH="/opt/homebrew/opt/curl/bin:$PATH"
export PATH="/opt/homebrew/opt/openssl@3.0/bin:$PATH"

export FZF_COMPLETION_TRIGGER=',,'
export FZF_DEFAULT_COMMAND='rga --files --hidden -g "!{node_modules,.git,.vscode,.cache,.terraform,.DS_Store,.Trash,.terraform.d,.npm,.dotfiles,.nvm}"'
export FZF_PREVIEW_COLUMNS
export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS \
  --highlight-line \
  --info=inline-right \
  --ansi \
  --border=none
  --color=bg+:#2d3f76 \
  --color=bg:#1e2030 \
  --color=border:#589ed7 \
  --color=fg:#c8d3f5 \
  --color=gutter:#1e2030 \
  --color=header:#ff966c \
  --color=hl+:#65bcff \
  --color=hl:#65bcff \
  --color=info:#545c7e \
  --color=marker:#ff007c \
  --color=pointer:#ff007c \
  --color=prompt:#65bcff \
  --color=query:#c8d3f5:regular \
  --color=scrollbar:#589ed7 \
  --color=separator:#ff966c \
  --color=spinner:#ff007c \
  --preview-window=top,70%:wrap \
  "

export FORGIT_FZF_DEFAULT_OPTS="
--cycle
--preview-window 'top:wrap'
--height '90%'
"

# vault login -method=userpass username=$VAULT_USERNAME password=$VAULT_PASSWORD
