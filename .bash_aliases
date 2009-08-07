#!/bin/bash

# Alias ls
alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'
alias gem='sudo /usr/local/bin/gem'
alias bin_gem='sudo /usr/bin/gem'
alias gem-e='sudo /opt/ruby-enterprise/bin/gem'
alias irb-e='/opt/ruby-enterprise/bin/irb'
alias a2ctl='sudo apache2ctl'

function emacs_lite {
  /usr/bin/emacs-snapshot-nox -q $1
}

# Shows the git status of the current dir and all the available submodules.
function git-status-recursive {
    for dir in $(find . -type d -name .git); do
	cd $(dirname $dir)
	echo ""
	echo "================================================================================================"
	echo "Showing status for: $(pwd)"
	echo "================================================================================================"
	git status
	cd $OLDPWD
    done
}

# Alias emacs
function e {
    if [ -z $1 ]; then
        FILE="."
    else
        FILE=$@
    fi
    /usr/bin/emacsclient -a /usr/bin/emacs $FILE 2> /dev/null &
}

# Open git-status in emacs
function git-emacs {
    /usr/bin/emacsclient --eval "(git-status \"$(pwd)\")"
}

function first-nameserver {
    grep nameserver /etc/resolv.conf | uniq -w 10 | awk '{print $2}'
}

function list-nameservers {
    grep nameserver /etc/resolv.conf | awk '{print $2}'
}

function ping-nameserver {
    ping $(first-nameserver)
}

function firefox2 {
    /home/jorge/Downloads/packages/firefox/firefox -P firefox2 $@ &
}