# .BASHRC WORK-PC ver: 1.2 (2016-06-27)
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

PS1='[\u@\h:\w]$ '
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
alias inoteska='ssh user@inoteska'

