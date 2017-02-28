# .BASHRC PI  version 2.1 (2017-02-28)

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# HISTORY
export HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoredups
export HISTCONTROL=ignoreboth
shopt -s histappend
HISTTIMEFORMAT="%d/%m/%y %T "

# check the window size after each command and, if necessary, update the values of LINES and COLUMNS.
# shopt options:    -s: Enable, -u: Disable, -q: Suppresses, -o: Restricts
shopt -s checkwinsize

# PS1='[\u@\h:\w]$ '
PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\$\[\033[00m\] '
PS2='> '

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    eval "`dircolors -b`"
    alias ls='ls --color=auto'
fi

# enable programmable completion features
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/Bin" ] ; then
    PATH="$HOME/Bin:/opt/lampp/bin:$PATH"
fi

# EXPORTS
export EDITOR=vim



# ALIASES
# ~~~~~~~
alias h=history                     # show the history of commands issued
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias ll='ls -lhAF'                              # long list
alias lk="ps -aef |grep -v grep | grep -i "
alias path="echo $PATH"

# UTILS
alias top10='du -ks * | sort -nr | head -10'
alias vimrc='grep VIMRC ~/.vimrc'
alias bashrc='grep .BASHRC ~/.bashrc |grep -v alias'
alias en='export LANG=en_US.UTF8'
alias he='export LANG=he_IL.UTF8'

#APT-GET
alias install='sudo apt-get install'
alias reinstall='sudo apt-get install --reinstall'
alias search='apt-cache search'
alias purge='sudo apt-get purge'
alias policy='sudo apt-cache policy'
alias clean='sudo apt-get clean'
alias check='sudo apt-get check'

# SHORTCUTS
alias storage1='cd /media/storage1'
alias storage2='cd /media/storage2'
alias pilatis='cd /media/storage2/Public/Music/Sport/Pilatis-2017'
alias mus='cd ~/Music'

