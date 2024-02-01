# this line is for profiling zsh start up time. It has a companion line at the very bottom
# both need to be commented and uncommented at the same time
#
# zmodload zsh/zprof

# Keep this near the top otherwise there's an non-zero exit code for some reason
[[ ! -f "$HOME"/.envrc ]] && printf '\e[1mYou forgot your .envrc\e[0m\n'

[[ is_mac ]] && ssh-add -K 2>/dev/null

# Enable Powerlevel10k instant prompt. Should stay close to the top of "$HOME"/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-"$HOME"/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-"$HOME"/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# mise for managing language/tool versions
eval "$(~/.local/bin/mise activate zsh)"
eval "$(mise hook-env)"
eval "$(direnv hook zsh)" &> /dev/null

[[ -f "$ZDOTDIR"/.zstyle ]] && source "$ZDOTDIR"/.zstyle

plugins=(
  zsh-autosuggestions
  extract
  zsh-syntax-highlighting
  # tmux
  fzf-tab
  autoupdate
  taskwarrior
  vi-mode
  zsh-interactive-cd
  forgit
  # evalcache
  kubectl
  )

[[ -f "$ZSH"/oh-my-zsh.sh ]] && source "$ZSH"/oh-my-zsh.sh
autoload -U add-zsh-hook

helper_files=(
  "$ZDOTDIR"/aliases.zsh
  "$ZDOTDIR"/.p10k.zsh
  "$ZDOTDIR"/kube.zsh
  "$ZDOTDIR"/scripts/utility-functions.zsh
  "$ZDOTDIR"/.zsh_opts
  "$ZDOTDIR"/zsh-helpers.zsh
  )

for file in $helper_files; do
  [[ -f $file ]] && source $file
done

autoload -Uz bashcompinit && bashcompinit
autoload -Uz compinit
# only check it once a day to see if it's changed
for dump in ~/.zcompdump(N.mh+24); do
  compinit
done
compinit -C

# I think fzf needs to be below completion init
[[ -f "$HOME"/.fzf.zsh ]] && source "$HOME"/.fzf.zsh

# zsh-like keybindings
bindkey -v
# This turns off direnv printing variables on every directory change
export DIRENV_LOG_FORMAT=""

# zprof
