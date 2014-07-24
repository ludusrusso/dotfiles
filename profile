echo "Bash di Ludovico"
export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$ "
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
alias ls='ls -GFh'


if [ -f ~/.git-completion.bash ]; then
    . ~/.git-completion.bash
fi

source ~/ros_catkin_ws/install_isolated/setup.bash
source ~/ros_ws/devel/setup.bash
source ~/hydro_ws/devel/setup.bash

export DYLD_FORCE_FLAT_NAMESPACE=1  # for YouCompleteMe




# for ROS configuration polimi
export DYLD_LIBRARY_PATH=$DYLD_LIBRARY_PATH:/Users/ludus/develop/polimi/flirtlib/ins/lib/flirtlib:/Users/ludus/develop/polimi/bespin/build/lib
