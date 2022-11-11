ZSH_THEME="sfr"

CASE_SENSITIVE="false"
HYPHEN_INSENSITIVE="true"

plugins=(zsh-autosuggestions colored-man-pages command-not-found cp compleat extract)

# Exports
export LANG=en_US.UTF-8
export HISTCONTROL=ignoreboth
export EDITOR=emacs
export VISUAL=emacs
export ZSH="$HOME/.config/oh-my-zsh"
export PATH=$HOME/bin:/usr/local/bin:$HOME/.emacs.d/bin/:$PATH
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#545454"
export XDG_RUNTIME_DIR="/tmp/runtime"

source $ZSH/oh-my-zsh.sh

# Aliases
alias c='clear'
alias ..='cd ..'
alias ls='exa -a --git --long -G -s name --color=auto'
alias mkdir='mkdir -pv'
alias free='free -mt'
alias ps='ps auxf'
alias psgrep='ps aux | grep -v grep | grep -i -e VSZ -e'
alias py='python'
alias wget='wget -c'
alias histg='history | grep'
alias myip='curl ipv4.icanhazip.com'
alias grep='grep --color=auto'
alias mv='mv -i'
alias rm='rm -i'
alias cp='cp -i'
alias vim='nvim'
