# sixninetynine's bashrc

# source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# shell options
shopt -s cdspell        # correct minor spelling mistakes in directory names for cd
shopt -s checkwinsize   # keep the LINES & COLUMNS variables updated
shopt -s cmdhist        # save multi-line commands as a single history entry
shopt -s lithist        # multi-line commands in the history should maintain the newlines
shopt -u dotglob        # do not glob files that begin with a period in expansion
shopt -s extglob        # add extended globing
shopt -s histappend     # append the history to HISTFILE instead of overwriting
shopt -s histreedit     # allow for re-edits on failed history commands
shopt -s histverify     # verify history command before passing it to the shell
shopt -s checkhash      # ensure a hash command exists before re-executing, otherwise search in PATH
shopt -s promptvars     # ensure our prompt is parsed
shopt -s checkwinsize   # make sure bash updates our window size so that lines wrap properly
set -o notify           # report on terminated background jobs immediately
set -o ignoreeof        # dont log out on eof (^D)

# history
HISTCONTROL=ignoredups:erasedups
HISTSIZE=100000
HISTFILESIZE=20000

# aliases
alias black="black -l 120"
alias cdd='cd `mktemp -d`'
alias d='deactivate'
alias g='grep'
alias grep='grep --color=auto '
alias h='history'
alias ls="exa -I '*.pyc'"
alias q='sudo su -'
alias s='ssh -A lcarvalh-ld2.linkedin.biz'
alias t='tmux -CC'
alias ta='tmux -CC attach'
alias td='tmux -CC detach'
alias vi="nvim"
alias vim="nvim"
alias hiss="PYTHONBREAKPOINT=ipdb.set_trace hiss"

# completion
[ -f /etc/profile.d/bash-completion ] && source /etc/profile.d/bash-completion
[ -f /etc/bash_completion ] && source /etc/bash_completion
[ -f ~/.git-completion.bash ] && source ~/.git-completion.bash
[ -f ~/.fzf/shell/completion.bash ] && source ~/.fzf/shell/completion.bash

if [ -f /export/content/linkedin/etc/bash ]; then
  for f in /export/content/linkedin/etc/bash/*
    do
      source $f
    done
fi

complete 2>&1 >/dev/null

if [ $? = 0 ]; then
# completion entries
    complete -A alias       alias unalias
    complete -A command     which
    complete -A export      export printenv
    complete -A hostname    ssh telnet ftp ncftp ping dig nmap
    complete -A helptopic   help
    complete -A job -P '%'  fg jobs
    complete -A setopt      set
    complete -A shopt       shopt
    complete -A signal      kill killall
    complete -A user        su userdel passwd
    complete -A group       groupdel groupmod newgrp
    complete -A directory   cd rmdir
fi

# ssh
[ `uname` != 'Darwin' ] && eval `keychain --eval id_rsa`

# java home
[ `uname` == 'Darwin' ] && export JAVA_HOME=`/usr/libexec/java_home 2>/dev/null` || export JAVA_HOME='/export/apps/jdk/JDK-1_8_0_172/'

# vim is god
export EDITOR=nvim

# pip / python
export PIP_REQUIRE_VIRTUALENV=true
export PIP_RESPECT_VIRTUALENV=true

# rust
if [ -f $HOME/.cargo/env ]; then
    source $HOME/.cargo/env
fi

# fzf
#source "$HOME/.fzf/shell/key-bindings.bash"
export FZF_DEFAULT_OPTS="--color=bg+:'#2e2e2f'"

# path
_PATH=$PATH
PATH=""
PATH+="/bin"
PATH+=":/export/apps/python/3.8/bin"
PATH+=":/export/apps/python/3.7/bin"
PATH+=":/export/apps/python/3.6/bin"
PATH+=":/export/apps/python/3.5/bin"
PATH+=":/export/apps/python/2.7/bin"
PATH+=":/export/apps/xtools/bin"
PATH+=":/export/apps/mysql/5.7/bin"
PATH+=":$HOME/.local/bin"
PATH+=":$HOME/bin"
PATH+=":$HOME/.fzf/bin"
PATH+=":$HOME/.yarn/bin"
PATH+=":$HOME/.volta/bin"
PATH+=":/usr/local/opt/coreutils/libexec/gnubin"
PATH+=":/usr/local/opt/coreutils/bin"
PATH+=":/export/content/granular/bin"
PATH+=":/export/content/linkedin/bin"
PATH+=":/usr/local/linkedin/bin"
PATH+=":/usr/local/bin"
PATH+=":/usr/local/go/bin"
PATH+=":$_PATH"
export PATH

# functions
allpytest() {
    app=`echo $PWD | awk -F/ '{print $NF}'`
    for venv in ../build/$app/venv*;
        do
            deactivate 2> /dev/null
            echo -en "\n\nRUNNING PY.TEST WITH" $venv "\n\n"
            source $venv/bin/activate
            py.test test
            deactivate
        done
}

ps1_git_branch() {
    ref=$(git symbolic-ref HEAD 2> /dev/null) || return
    git diff --quiet --ignore-submodules=dirty 2>/dev/null >&2 && dirty=" ✓" || dirty=" ±"
    echo " git:${ref#refs/heads/}${dirty}"
}

title() {
  if [ -z $TMUX ] ; then
     printf "\e]1;$@\a"
  else
     tmux rename-window $@
  fi
}

vv() {
  cdd
  python3 -m venv venv
  . venv/bin/activate
}

zipedit(){
    echo "Usage: zipedit archive.zip folder/file.txt"
    curdir=$(pwd)
    unzip "$1" "$2" -d /tmp
    cd /tmp
    vi "$2" && zip --update "$curdir/$1"  "$2"
    # remove this line to just keep overwriting files in /tmp
    rm -f "$2" # or remove -f if you want to confirm
    cd "$curdir"
}

# colors
export LSOPTIONS='--color'
export CLICOLOR=1
export PROMPT_DIRTRIM=2
export LESS='GeFRX'

# shiv
# export SHIV_COMPILE_PYC="false"

[ -f ~/.colors ] && source ~/.colors

eval $(dircolors /etc/DIR_COLORS 2> /dev/null)

# prompt
hn=`uname -a | cut -d ' ' -f 1 | awk '{print tolower($0)}'`
if [[ $- == *i* ]];
  then
    PS1="\[$NORMAL\]\[$BOLD\]\[$GREEN\]\${hn} \[$NORMAL\]\[$WHITE\]\w\[$BOLD\]\$(ps1_git_branch) \[$NORMAL\]$ "
fi

export VOLTA_HOME="$HOME/.volta"
[ -s "$VOLTA_HOME/load.sh" ] && . "$VOLTA_HOME/load.sh"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
