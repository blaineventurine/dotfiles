# Dotfiles Info

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

### Install Homebrew

```shell
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew bundle
```

### Misc

```shell
gh auth login
gh extension install dlvhdr/gh-dash
dots submodule update --init --recursive
bat cache --build
vale sync
autin login
```
