FIGNORE=".o"

xset b off

# bind 'TAB:menu-complete'
bind 'set show-all-if-ambiguous on'

if [[ -e /usr/lib/git-core/git-sh-prompt ]]; then
    . /usr/lib/git-core/git-sh-prompt
fi

. <(npm completion)

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
export ANDROID_EMULATOR_USE_SYSTEM_LIBS=1
export ANDROID_HOME=$HOME/Android/Sdk
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
export PATH="/bin:/sbin:/usr/bin:/usr/sbin:/usr/heimdal/bin:/usr/heimdal/sbin:$HOME/bin:/usr/local/bin:/usr/games:${ANDROID_HOME}/tools/bin:${PATH}:."
export PROMPT_COMMAND=__prompt_command

get_battery () {
    local BOLT_ICON="\u26A1"
    local YELLOW="\[\e[0;33m\]"
    local RED="\[\e[0;31m\]"
    local GREEN="\[\e[0;32m\]"
    local RESET="\[\e[0;0m\]"
    local BATTERY_PATH="/org/freedesktop/UPower/devices/battery_BAT0"
    local BATTERY_LEVEL=$(upower -i ${BATTERY_PATH} | grep -E "percentage")
    local BATTERY_STATUS=$(upower -i ${BATTERY_PATH} | grep -E "state")

    BATTERY_LEVEL=${BATTERY_LEVEL//[a-z]/}
    BATTERY_LEVEL=${BATTERY_LEVEL//[A-Z]/}
    BATTERY_LEVEL=${BATTERY_LEVEL//[:]/}
    BATTERY_LEVEL=${BATTERY_LEVEL//[ ]/}
    BATTERY_LEVEL=${BATTERY_LEVEL::-1}
    BATTERY_STATUS=${BATTERY_STATUS//[ ]/}
    BATTERY_STATUS=$(cut -d: -f2 <<< "${BATTERY_STATUS}")
    if [ $BATTERY_LEVEL -le 33 ]
    then
        BATTERY_LEVEL="${RED}${BATTERY_LEVEL}"
    elif [ $BATTERY_LEVEL -gt 33 ] && [ $BATTERY_LEVEL -le 66 ]
    then
        BATTERY_LEVEL="${YELLOW}${BATTERY_LEVEL}"
    else
        BATTERY_LEVEL="${GREEN}${BATTERY_LEVEL}"
    fi
    if [ "$BATTERY_STATUS" = "charging" ]
    then
        BATTERY_LEVEL+="${BOLT_ICON}${RESET}"
    else
        BATTERY_LEVEL+="${RESET}"
    fi
    echo -e ${BATTERY_LEVEL}
}

__prompt_command () {
    local EXIT="$?"
    local RED="\[\e[0;31m\]"
    local BLUE="\[\e[0;34m\]"
    local GREEN="\[\e[0;32m\]"
    local YELLOW="\[\e[0;33m\]"
    local RESET="\[\e[0;0m\]"

    PS1="\t "
    if [ $EXIT -eq 0 ]
    then
        PS1+="${GREEN}✔${RESET} "
    else
        PS1+="${RED}✘ [$EXIT]${RESET} "
    fi
    PS1+="\u"
    PS1+=" ($(get_battery)):"
    if [ -d ".git" ]
    then
        local git_str=$(git rev-parse --abbrev-ref --symbolic-full-name @{u})
        local remote=${git_str:0:6}
        if [ "$remote" = "origin" ]
        then
            PS1+=$(__git_ps1 "${RED}(%s)${RESET}")
        else
            PS1+="${RED}($git_str)${RESET}"
        fi
    fi
    PS1+="${BLUE}\w${RESET}\$ "
}
export PS1=$PS1

#aliases
alias dir='dir --color=auto'
alias diff='colordiff'
alias vdir='vdir --color=auto'
alias ls='ls --color=auto'
alias ll='ls -lh'
alias la='ls -lha'
alias tree='tree -a -I .git -f'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias ne='emacsclient --alternate-editor emacs'
alias pull='git pull'
alias sudo='sudo '
alias valgrind='valgrind '
alias gpp='g++ -W -Wall -Wextra -Werror --std=c++17'
alias xclip='xclip -selection c'
alias cat='bat'
alias bat='bat --paging never'
alias ip='ip --color'
alias ipb='ip --color --brief'
alias primusrun='vblank_mode=0 primusrun '
alias male='make'
alias makw='make'
