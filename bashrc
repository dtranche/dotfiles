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
    export PATH=$PATH:/home/scripts
else
    export CLASSPATH+=.:$HOME/Programming/Java/algorithms/stdlib.jar:$HOME/Programming/Java/algorithms/algs4.jar
    
fi
. /home/scripts/os_helper_functions.sh
. /home/scripts/rts_helper_functions.sh
for f in ~/environment/bash/*; do if [[ -f $f ]]; then . $f; fi; done


# User specific aliases and functions
export PATH=$PATH:~/bin:/opt/llvm/bin

export HISTCONTROL=ignoreboth

alias h='history'
alias grep='grep --color'
alias hgrep='history | grep --color'
alias e='/usr/local/bin/emacs $@'
alias get_aws='/home/scripts/get_instance.sh centos7 8'
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


function title ( )
{
    TITLE=$*
    export PROMPT_COMMAND='echo -ne "\033]0;$TITLE\007"'
}

alias mailE='_mailE'
alias ppid='_ppid'

alias gucci='ssh -o ServerAliveInterval=120 denist@gucci'
alias prada='ssh -o ServerAliveInterval=120 denist@prada'

alias r_ssh='ssh -o ServerAliveInterval=120 -l denist '

export RATTSHOMEDIR='/home/sqa/ratts_release_fh'
if [ -f /home/sqa/bashrc-ratts ]; then
    . /home/sqa/bashrc-ratts 
fi 
