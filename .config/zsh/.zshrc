# this line is for profiling zsh start up time. It has a companion line at the very bottom
# both need to be commented and uncommented at the same time
#
# zmodload zsh/zprof

# Keep this near the top otherwise there's a non-zero exit code for some reason
[[ ! -f "$HOME"/.env ]] && printf '\e[1mYou forgot your .env\e[0m\n'

ssh-add -K 2>/dev/null

# Enable Powerlevel10k instant prompt. Should stay close to the top of "$HOME"/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
# if [[ -r "${XDG_CACHE_HOME:-"$HOME"/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#   source "${XDG_CACHE_HOME:-"$HOME"/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
# fi

eval "$(/opt/homebrew/bin/brew shellenv)"

# mise for managing language/tool versions
eval "$($HOMEBREW_PREFIX/bin/mise activate zsh)"
eval "$(mise hook-env)"

[[ -f "$ZDOTDIR"/.zstyle ]] && source "$ZDOTDIR"/.zstyle

autoload -U add-zsh-hook

helper_files=(
  "$ZDOTDIR"/aliases.zsh
  "$ZDOTDIR"/.p10k.zsh
  "$ZDOTDIR"/kube.zsh
  "$ZDOTDIR"/.zsh_opts
  "$ZDOTDIR"/zsh-helpers.zsh
  "$ZDOTDIR"/zsh-interactive-cd.zsh
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

# Tab completions need to be below compinit
source <(kubectl completion zsh)

# zsh-like keybindings
bindkey -v

export LS_COLORS="$(vivid generate tokyonight-moon)"

# fzf-tab needs to be loaded after compinit, but before plugins which will wrap widgets, such as zsh-autosuggestions or fast-syntax-highlighting
[[ ! -f "$ZDOTDIR"/fzf-tab/fzf-tab.plugin.zsh ]] && git clone https://github.com/Aloxaf/fzf-tab "$ZDOTDIR"/fzf-tab

source "$ZDOTDIR"/fzf-tab/fzf-tab.plugin.zsh

brew_zsh_plugins=(
  "share/zsh-autosuggestions/zsh-autosuggestions.zsh"
  "share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
  "opt/zsh-vi-mode/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh"
  "share/forgit/forgit.plugin.zsh"
)

# Precompute full paths for Homebrew plugins
typeset -A brew_plugin_paths
for plugin in $brew_zsh_plugins; do
  brew_plugin_paths[$plugin]="$HOMEBREW_PREFIX/$plugin"
done

for plugin in $brew_zsh_plugins; do
  [[ -f ${brew_plugin_paths[$plugin]} ]] && source ${brew_plugin_paths[$plugin]}
done

zvm_after_init_commands+=('eval "$(fzf --zsh)"')
zvm_after_init_commands+=('eval "$(atuin init zsh)"')
zvm_after_init_commands+=('eval "$(starship init zsh)"')

# zprof
