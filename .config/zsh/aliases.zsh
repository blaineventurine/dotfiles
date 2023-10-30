alias -s {js,json,yaml,html,css,toml}='bat'
alias -s md='glow'
alias -s git="git clone"

alias -g G="| rga"

alias cat='bat'
alias co='checkout_branch'
alias cfg='cd ~/.config/nvim && vi'
alias cp='cp -v'
alias dev='npm run dev'
alias dirs='dirs -v'
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias dots='dotfiles'
alias f="fzf | xargs -I{} vim {}"
alias fif='find-in-file'
alias fim="find_files_with_multiple"
alias fzf="fzf --preview '([[ -f {} ]] && (bat {} || cat {})) || ([[ -d {} ]] && (tree -C {} | less)) || echo {} 2> /dev/null | head -200'"
alias g='git'
alias gdm='git branch --merged | grep -v "\*" | xargs -n 1 git branch -d'
alias gnc='ga && new-commit'
alias grep='rga'
alias ip='ip --color=auto'
alias rg='rga'
alias k='kubectl'
alias l='eza -lbFha --icons --group-directories-first' # list, size, type, git
alias less='bat'
alias lg='lazygit'
alias lt='eza -TlbFha --git --icons --group-directories-first --level=2'
alias mv='mv -v'
alias pip="pip3"
alias py="python3"
alias python="python3"
alias rm='rm -v'
alias shutdown='sudo shutdown -h now'
alias sudo="sudo "
alias tf='terraform'
alias tx='tmuxinator'
alias update="update_global_packages"
alias updatep10k='git -C $ZSH_CUSTOM/themes/powerlevel10k pull'
alias vi='nvim'
alias vim='nvim'

if is_mac; then
  # KUBE DEPLOY
  # alias railsc-live="kc-purple; kubectl exec -it $""(kubectl get pods -n portal-live -l app=portal-sidekiq | grep Running | head -n 1 | cut -d ' ' -f 1) -n portal-live -- bash -c \"bundle exec bin/rails console -- --nomultiline\""
  # alias railsc-write="kc-purple; kubectl exec -it $""(kubectl get pods -n portal-live -l app=portal-sidekiq | grep Running | head -n 1 | cut -d ' ' -f 1) -n portal-live -- bash -c \"CONSOLE_WRITE=1 bundle exec bin/rails console -- --nomultiline\""
  # alias packages=`find . -iname package.json ! -path '*/node_modules/*' -exec yarn -V --cwd "{} | dirname" ';'`
  alias packages="yarn --cwd ~/repos/AlgoliaWeb/_client && cd ~/repos/AlgoliaWeb/backend && bundle install && yarn"
  alias start="cd ~/repos/AlgoliaWeb/backend && foreman start"
  alias test:backend="cd ~/repos/AlgoliaWeb/backend && rake parallel:create && rake db:migrate && rake parallel:prepare && rake parallel:spec"
  alias test:client="cd ~/repos/AlgoliaWeb/_client && yarn test"
  # alias drop-all="sh ~/scripts/drop-all.sh"
  alias init-all="cd ~/repos/AlgoliaWeb/backend && rake db:create && rake db:migrate"
  alias storybook="cd ~/repos/AlgoliaWeb/_client && yarn storybook"
  alias console="cd ~/repos/AlgoliaWeb/backend && rails console"
  alias e2e:dev="cd ~/repos/AlgoliaWeb/_client && yarn e2e:dev:with-backend"
  alias e2e:beta="cd ~/repos/AlgoliaWeb/_client && yarn e2e:dev"
  alias e2e:test="cd ~/repos/AlgoliaWeb/_client && yarn e2e:test:with-backend"
fi
