# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# don't overwrite GNU Midnight Commander's setting of `ignorespace'.
export HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoredups
# ... or force ignoredups and ignorespace
export HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

#if [ -f ~/.bash_aliases ]; then
#    . ~/.bash_aliases
#fi

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    eval "`dircolors -b`"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    #alias grep='grep --color=auto'
    #alias fgrep='fgrep --color=auto'
    #alias egrep='egrep --color=auto'
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/Bin" ] ; then
    PATH="$HOME/Bin:/opt/lampp/bin:$PATH"
fi

export EDITOR=vim
alias top10='du -ks * | sort -nr | head -10'
alias en='LANG=en_US.UTF8'
alias rm='rm -i'
alias cp='cp -i'
alias xampp='sudo /opt/lampp/lampp start'
alias mv='mv -i'
alias p='ps -aef |grep '
alias df='df -h'
alias du='du -h'
alias ls='ls -hF --color=tty'                 # classify files in colour
alias ll='ls -l'                              # long list
alias lm="ls -al | more"
alias la='ls -A'                              # all but . and ..
alias h=history                     # show the history of commands issued
alias nu="who|wc -l"                # nu - number of users
alias np="ps -ef|wc -l"             # np - number of processes running
alias cd..="cd ../.."
alias cd...="cd ../../.."
alias en='export LANG=en_US.UTF8'
alias he='export LANG=he_IL.UTF8'
alias path="echo $PATH"
alias lk="ps -aef |grep -i "
alias install='sudo apt-get install' 
alias reinstall='sudo apt-get install --reinstall' 
alias search='apt search'
alias purge='sudo apt-get purge'
alias clean='sudo apt-get clean'
alias update='echo "ilan1234" | sudo -S  apt update' 
alias upgrade='echo "ilan1234" |sudo apt update; sudo -S  apt dist-upgrade'
alias add-ppa='sudo add-apt-repository'	# add-apt-repository ppa:tualatrix/ppa
alias g='vim --remote-silent'
alias lk='ps -aef |grep -i '
alias pi='ssh pi@10.0.0.100'
alias lampp='sudo /opt/lampp/lampp start'
alias doc='cd ~/Documents'
alias music='cd ~/Music'
alias gitupdate='git add . && git commit -m "Another Commit" && git push'
alias cputemp='sensors | grep Core'
# Youtube-dl exapmle: 
# youtube-dl -x --audio-format "mp3" --audio-quality "0"  YOUTUBE_LINK
