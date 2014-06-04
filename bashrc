# edit by changing to shell-script-mode
# .bashrc


# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# differentiate between Redline and other accounts
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


if [ $UID == $DENIST_UID ]; then
    if [ -e ~/local/bin/emacs ]; then
        alias emacs=~/local/bin/emacs
    fi
else
    export CLASSPATH+=.:$HOME/Programming/Java/algorithms/stdlib.jar:$HOME/Programming/Java/algorithms/algs4.jar
    
fi

for f in ~/environment/bash/*; do if [[ -f $f ]]; then . $f; fi; done

# User specific aliases and functions
export PATH=$PATH:~/bin:/opt/llvm/bin

export HISTCONTROL=ignoreboth

alias h='history'
alias grep='grep --color'
alias hgrep='history | grep --color'
alias e='/usr/local/bin/emacs $@'

export LESS='-j24 -X'     

# @<notebook>#<tag>#<tag>
# notebook and tags must exist
function _mailE
{
    mailx -s $1 dtranchemontagne.3228de6@m.evernote.com;
}

function build_cscope ( )
{
    find -L . -name \*.cc -o -name \*.cpp -o -name \*.c -o -name \*.h  > cscope.files
    cscope -b -k
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

alias gateway='ssh -X -o ServerAliveInterval=120 denist@gateway'
alias prada='ssh -X -o ServerAliveInterval=120 denist@prada'

