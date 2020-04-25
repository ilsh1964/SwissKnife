#!/bin/bash

dpkg -l | grep -qw gdebi || sudo apt-get install -yyq gdebi
dpkg -l | grep -qw synaptic || sudo apt-get install -yyq synaptic
dpkg -l | grep -qw synapse || sudo apt-get install -yyq synapse
dpkg -l | grep -qw zeitgeist || sudo apt-get install -yyq zeitgeist
dpkg -l | grep -qw htop || sudo apt-get install -yyq htop
dpkg -l | grep -qw zim || sudo apt-get install -yyq zim
dpkg -l | grep -qw dropbox || sudo apt-get install -yyq dropbox
dpkg -l | grep -qw keepassx || sudo apt-get install -yyq keepassx
dpkg -l | grep -qw filezilla || sudo apt-get install -yyq filezilla
#dpkg -l | grep -qw preload || sudo apt-get install -yyq preload
#dpkg -l | grep -qw virtualbox-qt || sudo apt-get install -yyq virtualbox-qt
#dpkg -l | grep -qw virtualbox-ext-pack || sudo apt-get install -yyq virtualbox-ext-pack
#dpkg -l | grep -qw virtualbox-guest-additions-iso || sudo apt-get install -yyq virtualbox-guest-additions-iso
dpkg -l | grep -qw redshift-gtk || sudo apt-get install -yyq redshift-gtk
dpkg -l | grep -qw caffeine || sudo apt-get install -yyq caffeine
dpkg -l | grep -qw doublecmd-gtk || sudo apt-get install -yyq doublecmd-gtk
dpkg -l | grep -qw soundconverter || sudo apt-get install -yyq soundconverter
dpkg -l | grep -qw python-pip || sudo apt-get install -yyq python-pip
dpkg -l | grep -qw unison-gtk || sudo apt-get install -yyq unison-gtk
dpkg -l | grep -qw easytag || sudo apt-get install -yyq easytag
dpkg -l | grep -qw mnemosyne || sudo apt-get install -yyq mnemosyne
dpkg -l | grep -qw gcolor2 || sudo apt-get install -yyq gcolor2
dpkg -l | grep -qw guake || sudo apt-get install -yyq guake
# ??? dpkg -l | grep -qw clipit || sudo apt-get install -yyq clipit
# dpkg -l | grep -qw gparted || sudo apt-get install -yyq gparted
dpkg -l | grep -qw grsync || sudo apt-get install -yyq grsync
# dpkg -l | grep -qw ffmpeg || sudo apt-get install -yyq ffmpeg

# Google Chrome
app_exist=`dpkg -l |grep google-chrome | wc -l`
if [ $app_exist -eq 0 ]
then
    wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
    sudo gdebi -n google-chrome-stable_current_amd64.deb
    rm google-chrome-stable_current_amd64.deb
fi

# Ubuntu Cleaner
app_exist=`dpkg -l |grep ubuntu-cleaner | wc -l`
if [ $app_exist -eq 0 ]
then
    sudo apt-add-repository -y ppa:gerardpuig/ppa
    sudo apt-get update -qq
    sudo apt-get install -yyq ubuntu-cleaner
fi

# Purge
dpkg -l | grep thunderbird && sudo apt-get purge -yyqq  thunderbird
dpkg -l | grep -qw tomboy &&  sudo apt-get purge -yyqq  tomboy
dpkg -l | grep -qw hexchat && sudo apt-get purge -yyqq  hexchat

# Oracle VirtualBox
echo "deb https://download.virtualbox.org/virtualbox/debian xenial contrib " >> /etc/apt/sources
sudo apt-key add oracle_vbox_2016.asc
sudo apt update
sudo apt install virtualbox-5.2
sudo apt install dkms

echo "——————–  Done!  ——————–"
