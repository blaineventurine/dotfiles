# . "$HOME/.cargo/env"
export UPDATE_ZSH_DAYS=1
export TERM="xterm-256color" # This sets up colors properly
export CARGOPATH="$HOME/.cargo/bin"
export COLUMNS
export COMPLETION_WAITING_DOTS="true"
export DISABLE_AUTO_TITLE=true
export DOTNETPATH="$HOME/.dotnet/tools"
export DOTNET_CLI_TELEMETRY_OPTOUT=true
export EDITOR='nvim'
export FLYCTL_INSTALL="$HOME/.fly"
export FLYPATH="$FLYCTL_INSTALL/bin:$PATH"
export FZF_COMPLETION_TRIGGER=',,'
export FZF_DEFAULT_COMMAND='rga --files --hidden -g "!{node_modules,.git,.vscode,.cache,.terraform,.DS_Store,.Trash,.terraform.d,.npm,.dotfiles,.nvm}"'
export FZF_PREVIEW_COLUMNS
export GPG_TTY=$TTY
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LS_COLORS='di=1;34:ln=35:so=32:pi=0;33:ex=32:bd=34;46:cd=34;43:su=0;41:sg=0;46:tw=1;34:ow=1;34:'
export PAGER='bat'
export VISUAL='nvim' # editor to be opened from $PAGER
export VI_MODE_SET_CURSOR=true
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

export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS' 
	--color=fg:#c0caf5,bg:#1a1b26,hl:#bb9af7
	--color=fg+:#c0caf5,bg+:#1a1b26,hl+:#7dcfff
	--color=info:#7aa2f7,prompt:#7dcfff,pointer:#7dcfff 
	--color=marker:#9ece6a,spinner:#9ece6a,header:#9ece6a
  --preview-window=top,70%:wrap' 
  #
export FORGIT_FZF_DEFAULT_OPTS="
--cycle
--preview-window 'top:wrap'
--height '90%'
"

# vault login -method=userpass username=$VAULT_USERNAME password=$VAULT_PASSWORD
