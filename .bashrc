# loren carvalho | 2024

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

# aliases
alias cdd='cd `mktemp -d`'
alias d='deactivate'
alias g='grep'
alias grep='grep --color=auto '
alias h='history'
alias k='kubectl'
alias vi="nvim"
alias vim="nvim"
alias s="ssh -A lcarvalh-ld3.linkedin.biz"

# history
[[ -d ~/.history ]] && chmod 0700 ~/.history || mkdir -m 0700 ~/.history
export HISTFILE=~/.history/history.$(date +%y%b%d-%H%M%S).$$
export HISTFILESIZE=9999999
export HISTSIZE=9999999
export HISTIGNORE='ls:bg:fg:history'

# completion
[[ -r "/opt/homebrew/Cellar/bash-completion@2/2.14.0/share/bash-completion/bash_completion" ]] && . "/opt/homebrew/Cellar/bash-completion@2/2.14.0/share/bash-completion/bash_completion"
source <(kubectl completion bash) && complete -F __start_kubectl k
source /export/content/linkedin/etc/bash/*
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
complete 2>&1 >/dev/null

# fzf
[[ -f ~/.fzf.bash ]] && source ~/.fzf.bash
export FZF_DEFAULT_OPTS="--color=bg+:'#2e2e2f'"

# rust
[[ -f ~/.cargo/env ]] && source ~/.cargo/env

# rye
[[ -f ~/.rye/env ]] && source ~/.rye/env

# ssh
[[ `uname` != 'Darwin' ]] && eval `keychain --eval id_rsa`

# java home
[[ `uname` == 'Darwin' ]] && export JAVA_HOME=`/usr/libexec/java_home 2>/dev/null`

# vim is god
export EDITOR=nvim

# M1
export DOCKER_DEFAULT_PLATFORM=linux/amd64

# path
_PATH=$PATH
PATH=""
PATH+="/opt/homebrew/bin"
PATH+=":/bin"
PATH+=":/export/apps/python/3.12/bin"
PATH+=":/export/apps/python/3.11/bin"
PATH+=":/export/apps/python/3.10/bin"
PATH+=":/export/apps/python/3.9/bin"
PATH+=":/export/apps/xtools/bin"
PATH+=":/export/apps/mysql/5.7/bin"
PATH+=":$HOME/bin"
PATH+=":$HOME/.cargo/bin"
PATH+=":$HOME/.local/bin"
PATH+=":$HOME/.fzf/bin"
PATH+=":$HOME/.yarn/bin"
PATH+=":$HOME/.volta/bin"
PATH+=":$HOME/.kubectl-plugins"
PATH+=":$HOME/.krew/bin"
PATH+=":/usr/local/opt/coreutils/libexec/gnubin"
PATH+=":/usr/local/opt/coreutils/bin"
PATH+=":/export/content/granular/bin"
PATH+=":/export/content/linkedin/bin"
PATH+=":/usr/local/linkedin/bin"
PATH+=":/usr/local/bin"
PATH+=":$_PATH"
export PATH

# colors
export LSOPTIONS='--color'
export CLICOLOR=1
export PROMPT_DIRTRIM=2
export LESS='GeFRX'
[[ -f ~/.colors ]] && source ~/.colors
eval $(dircolors /etc/DIR_COLORS 2> /dev/null)

# prompt
PROMPT_COMMAND='history -a'

find_dot_git() {
  curdir=${1}
  [[ ${curdir} == "/" ]] && return 1
  [[ -d ${curdir}/.git ]] && return 0 || find_dot_git $(dirname ${curdir})
}

parse_git_branch() {
  find_dot_git ${PWD}
  if [[ ${?} -eq 0 ]]; then
    branch=$(git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/')
    # Outputs a series of indicators based on the status of the
    # working directory:
    # + changes are staged and ready to commit
    # ! unstaged changes are present
    # ? untracked files are present
    # S changes have been stashed
    # P local commits need to be pushed to the remote
    local status="$(git status --porcelain 2>/dev/null)"
    local output=''
    [[ -n $(egrep '^[MADRC]' <<<"$status") ]] && output="$output+"
    [[ -n $(egrep '^.[MD]' <<<"$status") ]] && output="$output!"
    [[ -n $(egrep '^\?\?' <<<"$status") ]] && output="$output?"
    [[ -n $(git stash list) ]] && output="${output}(stash)"
    # [[ -n $(git log --branches --not --remotes) ]] && output="${output}P"
    [[ -n $output ]] && branch="$branch/$output"  # separate from branch name
    echo "(${branch}) "
  fi
}

_HN=$(uname -a | cut -d ' ' -f 1 | awk '{print tolower($0)}')
if [[ $- == *i* ]]; then
  PS1="\[$NORMAL\]\[$BOLD\]\[$GREEN\]\${_HN} \[$NORMAL\]\[$WHITE\]\w\[$BOLD\] \$(parse_git_branch)\[$NORMAL\]$ "
fi
. "$HOME/.cargo/env"
