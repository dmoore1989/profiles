export PATH=/opt/homebrew/bin:$PATH
## start profile
[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile
## end profile

parse_git_branch() {
    git branch 2> /dev/null | sed -n -e 's/^\* \(.*\)/[\1]/p'
}
COLOR_DEF='%f'
COLOR_USR='%F{243}'
COLOR_DIR='%F{197}'
COLOR_GIT='%F{39}'
NEWLINE=$'\n'
setopt PROMPT_SUBST
export PROMPT='${COLOR_USR}%n@%M ${COLOR_DIR}%d ${COLOR_GIT}$(parse_git_branch)${COLOR_DEF}${NEWLINE}%% '

if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
  fi



alias bp='vim ~/.zprofile'
alias gc='git commit -m'
alias ga='git add -A'
alias mainit='git checkout main'
alias checkit='git checkout'
alias branchit='git checkout -b'
alias rebaseit="git checkout main&& git pull && git checkout - && git rebase main"
alias pushit='git push --set-upstream origin'
alias lastone="git checkout -"
alias amendit="git commit --amend"
alias lintit="bundle exec standardrb --fix && bundle exec erblint app/views app/components  -a && yarn lint:fix"
alias mergemain="git checkout main&&git pull&&git checkout -&&git merge main"
alias part2="cat day_${1:-$(date '+%e')}_1.rb >> day_${1:-$(date '+%e')}_2.rb"
export PATH=$PATH:/Users/username/src/sre/kubectl-plugins
export GOPATH=$HOME/go
export GOROOT="$(brew --prefix golang)/libexec"
export PATH="$PATH:${GOPATH}/bin:${GOROOT}/bin"
export PGPASSFILE='/Users/domoore/.pgpass'
export stopit='git restore db/structure.sql'


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Load Git completion
zstyle ':completion:*:*:git:*' script ~/.zsh/git-completion.bash
fpath=(~/.zsh $fpath)

autoload -Uz compinit && compinit
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(rbenv init - zsh)"
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
