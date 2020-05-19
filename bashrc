# .bashrc
# edit by changing to shell-script-mode (sh-mode)

# Source global definitions
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

export RATTSHOMEDIR='/home/sqa/ratts_release_fh'
#export RATTSHOMEDIR='/home/denist/ratts'

if [ -f /home/sqa/bashrc-ratts ]; then
    . /home/sqa/bashrc-ratts
fi

# differentiate between Redline and other accounts
DENIST_UID=557

#add classpath for coursera algorthims
#export ostype=`uname`

ulimit -c unlimited
if [ $UID == $DENIST_UID ]; then
    if [ -e /usr/bin/emacs-26.2 ]; then
        alias emacs=/usr/bin/emacs-26.2
    elif [ -e ~/emacs/rhel7/bin/emacs ]; then
        alias emacs=~/emacs/rhel7/bin/emacs
    elif [ -e ~/local/bin/emacs ]; then
        alias emacs=~/local/bin/emacs
    fi
    export fhlog=/var/opt/redline/inrush/log/inrush.log
		alias gdb='/opt/rh/devtoolset-7/root/usr/bin/gdb -x ~/bin/gdb_cmds.txt'
    export PATH=$PATH:/home/scripts
    export PATH=$PATH:/opt/redline/inrush/bin:/opt/redline/inrush/example
else
    export CLASSPATH+=.:$HOME/Programming/Java/algorithms/stdlib.jar:$HOME/Programming/Java/algorithms/algs4.jar
		alias gdb = gdb -x ~/bin/gdb_cmds.txt
fi

if grep -i -q -e "tranchemontagne|\Denis" /etc/motd; then
		'update_motd'
fi

# User specific aliases and functions
#export PATH=$PATH:~/bin:/opt/llvm/bin

export HISTCONTROL=ignoreboth
export CLICOLOR=1
alias h='history'
alias grep='grep --color'
alias hgrep='history | grep --color=always'
alias e='~/emacs/rhel7/bin/emacs --cscope $@'
alias get_aws='/home/scripts/get_instance.sh centos7 16'
alias get_aws_small='/home/scripts/get_instance.sh centos7 8'
alias ag='ag --noaffinity --silent'
alias cdcfg='cd /etc/opt/redline/inrush/config'
alias _rcore='sudo rm /tmp/core*'
alias _rmc='_rcore'
alias _e_cfg='sudoedit /etc/opt/redline/inrush/config/inrush.cfg'
alias _drop_cache='sudo su -c "echo 1 > /proc/sys/vm/drop_caches"'
alias gdb_attach='sudo gdb -x ~/bin/gdb_cmds.txt /opt/redline/inrush/bin/redline-inrush.exe -p `pidof /opt/redline/inrush/bin/redline-inrush.exe` '
alias _last_commit='git log -n 1 --oneline'

# To install standalone InRush
alias _rpmi='rpm -i --prefix=/tmp --dbpath /tmp/inrush_db --nodeps --noscripts'
alias _rpme='rpm -e --dbpath /tmp/inrush_db/ --noscripts'
alias _rpmq='rpm -qa --dbpath /tmp/inrush_db/'


#LS_COLORS="di=0;1;34:ow=00"

#export LESS='-j24 -X -R'

## Redline Paths
export FH_LIC_PATH='/etc/opt/redline/inrush/license'
export FH_LIC='/etc/opt/redline/inrush/license/inrush.lic'

function _rt ( )
{
   set -x
   testrunner -t `pwd`/$1 --record
   set +x
}
function _rrm ( )
{
  sudo service redline-resource-manager $1;
}
function _fh ( )
{
  sudo service redline-inrush $1;
}
function _ppid
{
    ps -p ${1:-$$} -o ppid=;
}
# function osType ( )
# {
#     echo $ostype
# }
function gdbCore ( )
{
		sudo chmod 777 $1
		gdb /opt/redline/inrush/bin/redline-inrush.exe -c $1
}
function title ( )
{
    TITLE=$*
    export PROMPT_COMMAND='echo -ne "\033]0;$TITLE\007"'
}

function _sed_del ( )
{
		sed -i -e "$1d" ~/.ssh/known_hosts
}


## License and Configuration
function fhlic () {
    echo "Copying license to ${FH_LIC_PATH}/"
    sudo mv ${FH_LIC} ${FH_LIC}.back
    sudo cp /home/licenses/rts-norisk.lic ${FH_LIC}
}

function _fhlatest() {
    ll -dt ~/rpm/RPMS/x86_64/redline-inrush* | head -n 1
}
function _fhinslatest ( )
{
		rpm -qa | grep redline-inrush | xargs sudo rpm -ev
		myrpm=`_fhlatest | awk '{print $NF}'`
		sudo rpm -ivh $myrpm
		sudo cp /etc/opt/redline/inrush/license/inrush.lic.rpmsave /etc/opt/redline/inrush/license/inrush.lic
    sudo cp /etc/opt/redline/inrush/config/inrush.cfg.rpmsave  /etc/opt/redline/inrush/config/inrush.cfg
    _fh start
}

function _setup_inrush ( )
{
		# use with either rhel6 or rhel7 as the input
		find  /home/release/resource-manager/RESOURCE-MANAGER-Release-1-1-10/server/ -name "redline-resource-manager-1.1.10-*$1*.rpm" -print0 | xargs -0 sudo rpm -i
		_fhinslatest
		fhlic
}

function _inrush_only ( )
{
	myrpm=`_fhlatest | awk '{print $NF}'`
  _rpme `_rpmq`
  _rpmi $myrpm
}

function _pytst ( )
{
	export PYTHONPATH=$PYTHONPATH:/opt/redline/inrush/ratts/fhlib
	export LD_PRELOAD=/usr/lib64/libasan.so.4
	export ASAN_OPTIONS=handle_segv=0:detect_leaks=0
}
function gdbfhstart()
{
   set -x
   sudo sed -i -e "s/daemon_wrapper LD_LIBRARY_PATH=\$LD_LIBRARY_PATH:\$RRM_LIB_DIR \$BIN_DIR\/redline-inrush\.exe --daemon --delta \$nyc_utc_delta --logfile \$LOG_DIR\/inrush\.log/LD_LIBRARY_PATH=\$LD_LIBRARY_PATH:\$RRM_LIB_DIR gdb --args \$BIN_DIR\/redline-inrush\.exe --delta \$nyc_utc_delta --logfile \$LOG_DIR\/inrush\.log/g" /opt/redline/inrush/bin/internal_control.sh
   set +x
}

function ungdbfhstart()
{
   set -x
   sudo sed -i -e "s/LD_LIBRARY_PATH=\$LD_LIBRARY_PATH:\$RRM_LIB_DIR gdb --args \$BIN_DIR\/redline-inrush\.exe --delta \$nyc_utc_delta --logfile \$LOG_DIR\/inrush\.log/daemon_wrapper LD_LIBRARY_PATH=\$LD_LIBRARY_PATH:\$RRM_LIB_DIR \$BIN_DIR\/redline-inrush\.exe --daemon --delta \$nyc_utc_delta --logfile \$LOG_DIR\/inrush\.log/g" /opt/redline/inrush/bin/internal_control.sh
   set +x
}

function gdbcfgrstart()
{
   set -x
   sudo sed -i -e "s/daemon_wrapper LD_LIBRARY_PATH=\$LD_LIBRARY_PATH\:\$RRM_LIB_DIR \$BIN_DIR\/inrush\.configger\.exe/LD_LIBRARY_PATH=\$LD_LIBRARY_PATH\:\$RRM_LIB_DIR gdb \$BIN_DIR\/inrush\.configger\.exe/g" /opt/redline/inrush/bin/internal_control.sh
   set +x
}

function ungdbcfgrstart() {
   set -x
   sudo sed -i -e "s/LD_LIBRARY_PATH=\$LD_LIBRARY_PATH\:\$RRM_LIB_DIR gdb \$BIN_DIR\/inrush\.configger\.exe/daemon_wrapper LD_LIBRARY_PATH=\$LD_LIBRARY_PATH\:\$RRM_LIB_DIR \$BIN_DIR\/inrush\.configger\.exe/g" /opt/redline/inrush/bin/internal_control.sh
   set +x
}

function _mc ()
{
		 mergecap -F libpcap -w - $1 | vnic_play.exe -tv -f -
}

function update_motd( )
{
		if grep -E -q "Tranchemontagne|Denis" /etc/motd; then
				quote_file=~/dotfiles/motd.quotes
				if [[ ! -f $quote_file ]]
				then
						str="
						\nDenis' daily quote ...
						\n... to get the full value of joy, you must have someone
						\nto divide it with.
						\n
						\n\t~ Mark Twain
						"
				else
						. $quote_file
						# Length of the bash array
						len=${#MotdStringArray[@]}
						index=$((RANDOM % ${len}))
						# Iterate over each element in the array
						#for val in "${MotdStringArray[@]}"; do echo -e $val; done
						quote=${MotdStringArray[$index]}
						str="Daily quote for Denis ...\n$quote"
				fi
				temp_file=$(mktemp)
				echo -e $str > ${temp_file}
				sudo cp ${temp_file} /etc/motd
				rm ${temp_file}
		fi
}

alias mailE='_mailE'
alias ppid='_ppid'

alias gucci='ssh -o ServerAliveInterval=120 denist@gucci'
alias prada='ssh -o ServerAliveInterval=120 denist@prada'

alias r_ssh='ssh -o ServerAliveInterval=120 -l denist '

alias r_sed_line='_sed_del'

export PYTHONPATH=$PYTHONPATH:/opt/redline/inrush/ratts/fhlib:/opt/redline/inrush/ratts
export ASAN_OPTIONS=alloc_dealloc_mismatch=0
