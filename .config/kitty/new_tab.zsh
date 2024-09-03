# Adds homebrew setup
eval "$(/opt/homebrew/bin/brew shellenv)"

# Integrates direnv
eval "$(direnv hook zsh)"

# $current_dir = $(pwd)

# echo pwd
# cd $pwd && cd -
