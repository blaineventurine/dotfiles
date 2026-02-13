# . "$HOME/.cargo/env"
export ANTHROPIC_BASE_URL=http://localhost:1234
export ANTHROPIC_AUTH_TOKEN=lmstudio
export COLUMNS
export COMPLETION_WAITING_DOTS="true"
export CPPFLAGS="-I/opt/homebrew/opt/curl/include"
export DISABLE_AUTO_TITLE=true
export DOTNET_CLI_TELEMETRY_OPTOUT=true
export EDITOR='nvim'
export EZA_CONFIG_DIR="$HOME/.config/eza"
export FLYCTL_INSTALL="$HOME/.fly"
export GPG_TTY=$TTY
export K9S_CONFIG_DIR="$HOME/.config/k9s"
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LDFLAGS="-L/opt/homebrew/opt/curl/lib"
export PAGER='bat'
export PKG_CONFIG_PATH="/opt/homebrew/opt/curl/lib/pkgconfig"
export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"
export TERM="xterm-256color" # This sets up colors properly
export UPDATE_ZSH_DAYS=1
export VISUAL='nvim' # editor to be opened from $PAGER
export VI_MODE_SET_CURSOR=true
export XDG_CONFIG_HOME=$HOME/.config
export ZSH_HIGHLIGHT_HIGHLIGHTERS_DIR="/opt/homebrew/share/zsh-syntax-highlighting/highlighters"
export ZVM_VI_ESCAPE_BINDKEY=jk

# Paths
export BIN_PATH="$HOME/bin"
export CARGOPATH="$HOME/.cargo/bin"
export CURL_PATH="/opt/homebrew/opt/curl/bin"
export DOTNETPATH="$HOME/.dotnet/tools"
export FLYPATH="$FLYCTL_INSTALL/bin:$PATH"
export LIBPQ_PATH="$PATH:/opt/homebrew/opt/libpq/bin"
export OPENSSL_PATH="/opt/homebrew/opt/openssl@3.0/bin"
export SCRIPT_PATH="$HOME/.local/bin"
export LM_STUDIO_PATH="$HOME/.cache/lm-studio/bin"

export FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

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
