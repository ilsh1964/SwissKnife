# .BASHRC HOME-PC  version 1.8 (2016-12-16)

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

export HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoredups
export HISTCONTROL=ignoreboth
shopt -s histappend

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# PS1='[\u@\h:\w]$ '
PS1='\[\033[01;32m\]\u@\h\[\033[00m\] \[\033[01;34m\]\w \$\[\033[00m\] '
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
alias ll='ls -l'                              # long list
alias la='ls -A'                              # all but . and ..
alias lk="ps -aef |grep -v grep | grep -i "
alias cd..="cd ../.."
alias path="echo $PATH"

# UTILS
alias top10='du -ks * | sort -nr | head -10'
alias lampp='sudo /opt/lampp/lampp start'
alias vimrc='grep VIMRC ~/.vimrc'
alias bashrc='grep .BASHRC ~/.bashrc |grep -v alias'
alias en='export LANG=en_US.UTF8'
alias he='export LANG=he_IL.UTF8'

#APT
alias install='sudo apt install'
alias reinstall='sudo apt install --reinstall'
alias search='apt search'
alias purge='sudo apt purge'
alias policy='sudo apt policy'
alias clean='sudo apt clean'
alias check='sudo apt check'

# SHORTCUTS
alias pi='ssh pi@10.0.0.100'
alias doc='cd ~/Documents'
alias dow='cd ~/Downloads'
alias mus='cd ~/Music'
alias vid='cd ~/Videos'
alias youtubedl-download-mp3='youtube-dl -x --audio-format "mp3" --audio-quality "0" '
alias youtubedl-upgrade='wget https://yt-dl.org/downloads/latest/youtube-dl -O /usr/local/bin/youtube-dl'
