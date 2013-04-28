alias o='xdg-open $@ > /dev/null 2> /dev/null'
alias     py="ipython"
alias    xit="exit"
alias    exi="exit"
alias   cd..="cd .."

alias gl="git log"

alias speedtest="curl http://ftp.atman.pl/test64mb -O /dev/null"
alias dwojka="mplayer -cache 256 http://stream.polskieradio.pl/program2"

[ -f ~/.bash_aliases.local ] && source ~/.bash_aliases.local
