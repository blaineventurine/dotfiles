# Dotfiles Info

- Install homebrew
- Install keepassxc
- Set up new ssh key for GitHub
- Set up bare git repo
- Install `oh-my-zsh`
- `brew bundle`
- `fzf` completions: `$(brew --prefix)/opt/fzf/install`

## Installs

### Set up bare git repo

```shell
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
<!-- echo ".dotfiles" >> .gitignore -->
git clone --bare git@github.com:blaineventurine/dotfiles.git $HOME/.dotfiles
dotfiles checkout
dotfiles config --local status.showUntrackedFiles no

dotfiles submodule update --remote
```

### Zsh setup

Install fonts from `.fonts/`

```shell
chsh -s $(which zsh)
#logout and log back in to your shell
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

p10k configure
```

Install homebrew

`/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`

```shell
install_tools
bat cache --build
vale sync
install_kitty
```
