# .BASHRC WORK-PC ver: 1.6 (2016-12-15)
# Shavit Ilan

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth
HISTSIZE=1000
HISTFILESIZE=2000

# PS1='[\u@\h:\w]$ '
PS1='\[\033[01;32m\]\u@\h\[\033[00m\] \[\033[01;34m\]\w \$\[\033[00m\] '
PS2='>'


# EXPORTS
export EDITOR=vim

# ALIAS
# ~~~~~~~
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias ls='ls -hF --color=tty'
alias ll='ls -l'
alias h=history
alias cd..="cd ../.."
alias cd...="cd ../../.."
alias path="echo $PATH"
alias lk="ps -aef |grep -v grep | grep -i "
alias firefox='x-www-browser'

# UTIL
alias vimrc='grep VIMRC ~/.vimrc'
alias bashrc='grep .BASHRC ~/.bashrc |grep -v alias'
alias kfirefox='killall firefox ; killall chrome'
alias dobackup='/home/ilan/Bin/rsyncBackup.sh'
alias top10='du -ks * | sort -nr | head -10'


# APT
alias install='sudo apt install'
alias reinstall='sudo apt install --reinstall'
alias search='apt search search'
alias policy='apt-cache policy '
alias purge='sudo apt purge'
alias clean='sudo apt-get clean'

# ssh connections
alias shavit='ssh shavit@shavit'
alias timsoret='ssh user@timsoret-vm'
alias mitug='ssh user@mitug-vm'
alias tikshuv='ssh user@syslog'
alias inoteska='ssh user@inoteska'
alias siteview='ssh user@siteview'

