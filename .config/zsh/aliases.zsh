alias -s {js,json,yaml,html,css,toml}='bat'
alias -s md='glow'
alias -s git='git clone'

alias -g G='| rga --hyperlink-format=kitty' # [G]rep
alias -g C="| wc -l"                 # [C]ount

alias cat='bat'
alias co='checkout_branch'
alias cfg='cd ~/.config/nvim && vi'
alias cp='cp -iv'
alias df='df -h'
alias dirs='dirs -v'
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias dots='dotfiles'
alias f='fzf | xargs -I{} nvim {}'
alias fif='find_in_file'
alias fim='find_files_with_multiple'
alias fz='fzf_custom'
alias g='git'
alias gdm='git branch --merged | grep -v "\*" | xargs -n 1 git branch -d'
alias gnc='ga && new-commit'
alias grep='rga --hyperlink-format=kitty'
alias icat='fd . ./ -e png | fzf --preview "fzf_preview {}"'
alias ip='ip --color=auto'
alias rg='rga --hyperlink-format=kitty'
alias k='kubectl'
alias l='eza -lbha -o --icons --group-directories-first --hyperlink --color-scale=size' # list, size, type, git
alias less='bat'
alias lg='lazygit'
alias lt='eza -Tlbha --git --icons --group-directories-first --level=2'
alias mv='mv -iv'
alias pip='pip3'
alias py='python3'
alias python='python3'
alias rm='rm -dIv'
alias rsync='rsync -az --info=progress2'
alias shutdown='sudo shutdown -h now'
alias spec='bundle exec rspec'
alias sudo='sudo '
alias tf='terraform'
alias update='update_global_packages'
alias updatep10k='git -C $ZSH_CUSTOM/themes/powerlevel10k pull'
alias vi='nvim'
alias vim='nvim'


fzf_custom() {
  fzf --preview "([[ -f {} ]] && (bat --color=always {} || cat {})) || ([[ -d {} ]] && (tree -C {} | less)) || echo {} 2> /dev/null | head -200"
}
