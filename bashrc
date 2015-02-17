echo "Bash di Ludovico"
export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$ "
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
alias ls='ls -GFh'

export DYLD_FORCE_FLAT_NAMESPACE=1

export PYTHONPATH=$PYTHONPATH:/Users/ludus/develop/parloma/robotcontrol/python

source ~/.bin/tmuxinator.bash

