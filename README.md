# Dotfiles Info

## Installs

### set up bare git repo

```shell
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
<!-- echo ".dotfiles" >> .gitignore -->
git clone --bare git@github.com:blaineventurine/dotfiles.git $HOME/.dotfiles
dotfiles checkout
dotfiles config --local status.showUntrackedFiles no
```

### zsh setup

Get fonts from [here](https://github.com/romkatv/powerlevel10k#meslo-nerd-font-patched-for-powerlevel10k)

```shell
chsh -s $(which zsh)
#logout and log back in to your shell
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

p10k configure
```

### Linux

#### packages

```shell
sudo apt install curl
add-pkg-repos
sudo apt update; sudo apt updgrade; xargs sudo apt -y install < packages.txt;
install_zsh_plugins
install-tools
update-submodules
bat cache --build
```

#### vale

Install based on directions on website
run `vale sync` to download packages

### MacOS

Get FZF from step above
Install homebrew

`/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`

### asdf

If asdf is causing solargraph issues, do

```shell
GEM_HOME="$HOME/.local/share/nvim/lsp_servers/solargraph" GEM_PATH="$HOME/.local/share/nvim/lsp_servers/solargraph" bundle install
```

from within project dir and also make sure `~/.tool-versions` specifies the proper version of Ruby

### misc tools

```shell
dotnet tool install --global dotnet-ef
```

### clone tasks

```shell
git clone git@github.com:blaineventurine/tasks.git
```

### clone notes

TODO

## Tmux

TODO

## Keybindings

| C-a +  | Action                                                                           |
| ------ | -------------------------------------------------------------------------------- |
| C-e    | Open ~/.tmux.conf file in your $EDITOR                                           |
| C-r    | Reload tmux configuration from ~/.tmux.conf file                                 |
| r      | Rename current window                                                            |
| R      | Rename current session                                                           |
| \_     | Split new pane horizontally                                                      |
| \|     | Split new pane vertically                                                        |
| <      | Select next pane                                                                 |
| >      | Select previous pane                                                             |
| ←      | Select pane on the left                                                          |
| →      | Select pane on the right                                                         |
| ↑      | Select pane on the top                                                           |
| ↓      | Select pane on the bottom                                                        |
| C-←    | Resize pane to the left                                                          |
| C-→    | Resize pane to the right                                                         |
| C-↑    | Resize pane to the top                                                           |
| C-↓    | Resize pane to the bottom                                                        |
| Tab    | Switch to most recently used window                                              |
| L      | Link window from another session by entering target session and window reference |
| \      | Swap panes back and forth with 1st pane                                          |
| C-o    | Swap current active pane with next one                                           |
| +      | Toggle zoom for current pane                                                     |
| x      | Kill current pane                                                                |
| X      | Kill current window                                                              |
| C-x    | Kill other windows (with confirmation)                                           |
| Q      | Kill current session (with confirmation)                                         |
| C-u    | Merge current session with another                                               |
| d      | Detach from session                                                              |
| D      | Detach other clients except current one from session                             |
| C-s    | Toggle status bar visibility                                                     |
| m      | Monitor current window for activity                                              |
| M      | Monitor current window for silence by entering silence period                    |
| F12    | Switch off all key binding and prefix handling in current window                 |
| c      | New window                                                                       |
| [0..9] | Switch active window by number                                                   |
| q      | Show pane numbers                                                                |
| s      | Show active sessions                                                             |
| (      | Switch to previous session                                                       |
| )      | Switch to next session                                                           |
| :new   | New session                                                                      |
| I      | Install new plugin                                                               |
| U      | Update plugins                                                                   |

No Prefix:

| Binding | Action                    |
| ------- | ------------------------- |
| C-h     | Select pane to the left   |
| C-j     | Select pane to the bottom |
| C-k     | Select pane to the top    |
| C-l     | Select pane to the right  |

## Vim setup

TODO: set these as post-install hooks:

`:PackerSync`
`:MasonInstall`
`:GoInstallBinaries`
`:GlowInstall`
