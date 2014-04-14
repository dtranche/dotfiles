# edit by changing to shell-script-mode
# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi
#add classpath for coursera algorthims
export ostype=`uname`

case $ostype in 
Darwin)
        echo I am a Mac
        ;;
Linux)
        echo I am Linux
        ;;
esac

#export CLASSPATH+=.:/home/denis/algs4/stdlib.jar:/home/denis/algs4/algs4.jar
export CLASSPATH+=.:$HOME/Programming/Java/algorithms/stdlib.jar:$HOME/Programming/Java/algorithms/algs4.jar

# User specific aliases and functions
export PATH=$PATH:~/bin:/opt/llvm/bin

export HISTCONTROL=ignoreboth

alias h='history'
alias hgrep='history | egrep'
alias e='/usr/local/bin/emacs $@'

export LESS='-j24 -X -I'     

# @<notebook>#<tag>#<tag>
# notebook and tags must exist
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


