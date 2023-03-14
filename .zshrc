# loren carvalho | 2025

# source global definitions
if [ -f /etc/zshrc ]; then
    . /etc/zshrc
fi

# source homebrew site functions
if [ -d /opt/homebrew/share/zsh/site-functions ]; then
    fpath+=("/opt/homebrew/share/zsh/site-functions")
fi

# home / end / delete
bindkey  "^[[H"   beginning-of-line
bindkey  "^[[F"   end-of-line
bindkey  "^[[3~"  delete-char

# shell options
setopt auto_cd              # cd by just typing directory name
setopt correct              # correct minor spelling mistakes in commands
setopt extended_glob        # add extended globbing
setopt share_history        # share history between sessions
setopt append_history       # append the history to HISTFILE instead of overwriting
setopt hist_ignore_dups     # ignore duplicate commands in history
setopt hist_verify          # verify history command before passing it to the shell
setopt ignore_eof           # dont log out on eof (^D)
setopt no_beep              # no beeping
setopt notify               # report on terminated background jobs immediately
setopt prompt_subst         # allow parameter expansion in prompts

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
alias dot='/usr/bin/git --git-dir="$HOME/.dotfiles" --work-tree="$HOME"'
alias obs="cd ~/Documents/Obsidian && claude \"Read META.md for current context, then check today's daily note and help me get started based on time of day.\""

# history
[[ -d ~/.history ]] && chmod 0700 ~/.history || mkdir -m 0700 ~/.history
export HISTFILE=~/.history/history.$(date +%y%b%d-%H%M%S).$$
export SAVEHIST=9999999
export HISTSIZE=9999999

# completion
if [ -d /export/content/linkedin/etc/zsh ]; then
    # add linkedin completions to fpath before compinit
    fpath=(/export/content/linkedin/etc/zsh $fpath)
fi

# cache compinit for faster startup
autoload -Uz compinit
if [[ -n ${ZDOTDIR}/.zcompdump(#qN.mh+24) ]]; then
    compinit
else
    compinit -C
fi

# kubectl completion
if command -v kubectl &> /dev/null; then
    if [[ ! -f ~/.zsh/kubectl_completion.zsh ]] || [[ ! -s ~/.zsh/kubectl_completion.zsh ]]; then
        mkdir -p ~/.zsh
        kubectl completion zsh > ~/.zsh/kubectl_completion.zsh
    fi
    source ~/.zsh/kubectl_completion.zsh
    compdef __start_kubectl k
fi

# fzf
[[ -f ~/.fzf.zsh ]] && source ~/.fzf.zsh
export FZF_DEFAULT_OPTS="--color=bg+:'#2e2e2f'"

# rust
[[ -f ~/.cargo/env ]] && source ~/.cargo/env

# rye
[[ -f ~/.rye/env ]] && source ~/.rye/env

# ssh
[[ `uname` != 'Darwin' ]] && eval `keychain --eval id_rsa`

# java home
if [[ `uname` == 'Darwin' ]]; then
    if [[ -z "$JAVA_HOME" ]]; then
        export JAVA_HOME=`/usr/libexec/java_home 2>/dev/null`
    fi
fi

# vim
export EDITOR=nvim

# M*
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
export LESS='GeFRX'

# prompt
autoload -U promptinit; promptinit
prompt pure
