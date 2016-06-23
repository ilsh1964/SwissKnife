# .BASHRC WORK-PC ver: 1.1 (2016-06-23)
# Shavit Ilan

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth
HISTSIZE=1000
HISTFILESIZE=2000

if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\u@\h \w-> "
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
fi

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# EXPORTS
export EDITOR=vim

# ALIAS
# ~~~~~~~
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias ls='ls -hF --color=tty'                 # classify files in colour
alias ll='ls -l'                              # long list
alias h=history                     # show the history of commands issued
alias cd..="cd ../.."
alias cd...="cd ../../.."
alias path="echo $PATH"
alias lk="ps -aef |grep -i "
alias firefox='x-www-browser'

# UTIL
alias vimrc='grep VIMRC ~/.vimrc'
alias bashrc='grep .BASHRC ~/.bashrc |grep -v alias'
alias kfirefox='killall iceweasel'
alias dobackup='/home/ilan/Bin/rsyncBackup.sh'
alias top10='du -ks * | sort -nr | head -10'


# APT
alias install='apt install' 
alias reinstall='apt install --reinstall' 
alias search='apt search search'
alias policy='apt policy '
alias purge='apt purge'
alias clean='apt clean'

# ssh connections
alias shavit='ssh shavit@shavit'
alias timsoret='ssh user@timsoret-vm'
alias mitug='ssh user@mitug-vm'
alias tikshuv='ssh user@syslog'
