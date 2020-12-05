
## start profile
[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile
## end profile

function parse_git_branch () {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
  fi

RED="\[\033[0;31m\]"
YELLOW="\[\033[0;33m\]"
GREEN="\[\033[0;32m\]"
NO_COLOR="\[\033[0m\]"

PS1="$GREEN\u@\h$NO_COLOR:\w$YELLOW\$(parse_git_branch)$NO_COLOR\$ "

alias bp='vim ~/.bash_profile'
alias gc='git commit -m'
alias ga='git add -A'
alias masterit='git checkout master'
alias checkit='git checkout'
alias branchit='git checkout -b'
alias rebaseit="git checkout master && git pull && git checkout - && git rebase master"
alias pushit='git push --set-upstream origin'
alias lastone="git checkout -"
alias amendit="git commit --amend"
export PATH=$PATH:/Users/username/src/sre/kubectl-plugins
export PGPASSFILE='/Users/domoore/.pgpass'

export WORKON_HOME=~/.virtualenvs
VIRTUALENVWRAPPER_PYTHON='/Users/domoore/.pyenv/versions/3.6.4/bin/python3'
source ~/.pyenv/versions/3.6.4/bin/virtualenvwrapper.sh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

eval "$(direnv hook bash)"
