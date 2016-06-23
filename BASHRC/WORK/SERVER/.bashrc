# .BASHRC WORK-SERVER  ver: 1.1 (2016-06-23)
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

# PROMPTS
PS1='\[\u@\h \w\]$ '
PS2='\ '

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
fi

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

export EDITOR=vim

# ALIAS 
# ~~~~~ 
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

# UTIL
alias vimrc='grep VIMRC ~/.vimrc'
alias bashrc='grep .BASHRC ~/.bashrc |grep -v alias'
alias top10='du -ks * | sort -nr | head -10'

# SHORTCUTS
alias html='cd /var/www/html/'
alias log='cd /var/log/syslog/'

