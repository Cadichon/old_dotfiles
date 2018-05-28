export LD_PRELOAD=

FIGNORE=".o"

eval "$(thefuck --alias fuck)"

xset b off

# bind 'TAB:menu-complete'
bind 'set show-all-if-ambiguous on'

if [[ -e /usr/lib/git-core/git-sh-prompt ]]; then
    . /usr/lib/git-core/git-sh-prompt
fi

if [[ -e ~/.yadm/bash_completion ]]; then
    . ~/.yadm/bash_completion
fi


HISTCONTROL=ignoreboth
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# auto-completion
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# GCC Color error
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'
export LC_ALL='fr_FR.UTF-8'
export LANG='en_US.UTF-8'
export LANGUAGE='en_US.UTF-8'
export LESS_TERMCAP_mb=$(printf '\e[01;31m') # enter blinking mode - red
export LESS_TERMCAP_md=$(printf '\e[01;35m') # enter double-bright mode - bold, magenta
export LESS_TERMCAP_me=$(printf '\e[0m') # turn off all appearance modes (mb, md, so, us)
export LESS_TERMCAP_se=$(printf '\e[0m') # leave standout mode
export LESS_TERMCAP_so=$(printf '\e[01;33m') # enter standout mode - yellow
export LESS_TERMCAP_ue=$(printf '\e[0m') # leave underline mode
export LESS_TERMCAP_us=$(printf '\e[04;36m') # enter underline mode - cyan
export PAGER='most'
export SAVEHIST=1000
export WATCH='all'
export PATH="/bin:/sbin:/usr/bin:/usr/sbin:/usr/heimdal/bin:/usr/heimdal/sbin:$HOME/bin:/usr/local/bin:/usr/games:."
export PS1='\[\e[1;37m\]\t` error=$?; if [ $error = 0 ]; then echo "\[\e[32m\] ✔ "; else echo "\[\e[31m\] ✘ [$error] "; fi`\[\e[00;37m\]\u\[\e[01;37m\]:`[[ $(git status 2> \
/dev/null | head -n2 | tail -n1) != "# Changes to be committed:" ]] && echo "\[\e[31m\]" || echo "\[\e[33m\]"``[[ $(git status 2> /dev/null | tail -\
n1) != "nothing to commit (working directory clean)" ]] || echo "\[\e[32m\]"`$(__git_ps1 "(%s)\[\e[00m\]")\[\e[01;34m\]\w\[\e[00m\]\$ '

#aliases
alias dir='dir --color=auto'
alias diff='colordiff'
alias vdir='vdir --color=auto'
alias ls='ls --color=auto'
alias ll='ls -lh'
alias la='ls -lha'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias ne='emacsclient --alternate-editor emacs'
alias pull='git pull'
alias sudo='sudo '
alias valgrind='valgrind '
alias primusrun='primusrun '
alias gpp="g++ -W -Wall -Wextra -Werror --std=c++17"
alias xclip="xclip -selection c"
alias cat="bat"
alias bat="bat --paging never"
alias ip='ip --color'
alias ipb='ip --color --brief'


ANDROID_HOME=/home/cadichon/Android/Sdk
PATH="${ANDROID_HOME}/tools/bin:${PATH}"
export ANDROID_HOME PATH

export CC="cc_args gcc"
export CXX="cc_args g++"
