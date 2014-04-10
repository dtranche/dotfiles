# edit by changing to shell-script-mode
# .bashrc


# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi
# differentiat between Redline and other accounts
DENIST_UID=557

#add classpath for coursera algorthims
export ostype=`uname`

#echo breaks the build
case $ostype in 
Darwin)
#        echo I am running on a Mac
        ;;
Linux)
#        echo I am running on Linux
        ;;
esac

tif [ $UID == $DENIST_UID ]; then
    if [ -e ~/local/bin/emacs ]; then
        alias emacs=~/local/bin/emacs
    fi
fi

for f in ~/environment/bash/*; do if [[ -f $f ]]; then . $f; fi; done

export CLASSPATH+=.:/home/denis/algs4/stdlib.jar:/home/denis/algs4/algs4.jar

# User specific aliases and functions
export PATH=$PATH:~/bin:/opt/llvm/bin

export HISTCONTROL=ignoreboth

alias h='history'
alias hgrep='history | egrep'
alias e='/usr/local/bin/emacs $@'

export LESS='-j24 -X -I'     

function _mailE
{
    mailx -s $1 dtranchemontagne.3228de6@m.evernote.com;
}

function _ppid
{
    ps -p ${1:-$$} -o ppid=; 
}
function osType ( )
{
    echo $ostype
}
alias mailE='_mailE'
alias ppid='_ppid'


