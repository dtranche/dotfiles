# edit by changing to shell-script-mode
# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi
#add classpath for coursera algorthims
export CLASSPATH+=.:/home/denis/algs4/stdlib.jar:/home/denis/algs4/algs4.jar

# User specific aliases and functions
export PATH=$PATH:~/bin:/opt/llvm/bin

export HISTCONTROL=ignoreboth

alias h='history'
alias hgrep='history | egrep'
alias e='/usr/local/bin//emacs $@'

function _mailE
{
    mailx -r dtranche@gmail.com -s $1 dtranchemontagne.3228de6@m.evernote.com;
}

function _ppid
{
    ps -p ${1:-$$} -o ppid=; 
}
alias mailE='_mailE'
alias ppid='_ppid'


