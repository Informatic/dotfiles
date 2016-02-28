# Shortcuts
alias o='xdg-open $@ > /dev/null 2> /dev/null'
alias m="mplayer"
alias py="ipython"
alias gl="git log --format='%C(auto)%h%C(auto) %s%d' --color"
alias gs="git status -s"
alias gd="git diff"

# Typos, rather convenient
alias xit="exit"
alias exi="exit"
alias cd..="cd .."
alias :q=exit

alias speedtest="curl http://ftp.atman.pl/test64mb -O /dev/null"
alias dwojka="mplayer -cache 256 http://stream.polskieradio.pl/program2"

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# mosh mouse mode fix
function mousemode_on {
    perl -E ' print "\e[?1002h" '
}

function mousemode_off {
    perl -E ' print "\e[?1002l" '
}

function mosh-mouse {
    mousemode_on
    mosh $*
    mousemode_off
}
