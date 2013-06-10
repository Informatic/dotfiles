alias o='xdg-open $@ > /dev/null 2> /dev/null'
alias     py="ipython"
alias    xit="exit"
alias    exi="exit"
alias   cd..="cd .."

alias gl="git log"
alias :q=exit

alias speedtest="curl http://ftp.atman.pl/test64mb -O /dev/null"
alias dwojka="mplayer -cache 256 http://stream.polskieradio.pl/program2"


# Fast virtualenv creation
_VENV_HOME=$HOME/.virtualenv

_venv_activate() {
    local venv_name=$1
    . $_VENV_HOME/$venv_name/bin/activate
}

venv() {
    if [ $# -lt 1 ]; then
        type -t deactivate 2>/dev/null >/dev/null
        if [ $? == 0 ]; then
            deactivate
        else
            echo "usage: ..."
        fi
    else
        local venv_name=$1
        if [ -d "$_VENV_HOME/$venv_name" ]; then
            _venv_activate $venv_name
        else
            echo -n "Would you like to create venv \"$1\"? (Yn) "
            local res
            read res
            [[ "$res" == "n" ]] && return 0
            mkdir -p $_VENV_HOME
            virtualenv $_VENV_HOME/$venv_name
            _venv_activate $venv_name
        fi
    fi
}

_venv_completion()
{
    local cur prev words cword
    _init_completion || return

    local venv_list=$(ls $_VENV_HOME)
    COMPREPLY=( $(compgen -W "${venv_list}" -- ${cur}) )
    return 0
}
complete -F _venv_completion venv

function new-scratch {
    cur_dir="$HOME/scratch"
    new_dir="$HOME/tmp/scratch-`date +'%s'`"
    mkdir -p $new_dir
    ln -nfs $new_dir $cur_dir
    cd $cur_dir
    echo "New scratch dir ready for grinding ;>"
}

[ -f ~/.bash_aliases.local ] && source ~/.bash_aliases.local
