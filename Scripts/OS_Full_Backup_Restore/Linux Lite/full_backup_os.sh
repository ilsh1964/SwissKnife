#!/bin/sh
sudo rsync -ar --delete /bin    /BACKUP/RSYNC_TEST/
sudo rsync -ar --delete /boot   /BACKUP/RSYNC_TEST/
sudo rsync -ar --delete /etc    /BACKUP/RSYNC_TEST/
sudo rsync -ar --delete /lib    /BACKUP/RSYNC_TEST/
sudo rsync -ar --delete /lib64  /BACKUP/RSYNC_TEST/
sudo rsync -ar --delete /opt    /BACKUP/RSYNC_TEST/
sudo rsync -ar --delete /root   /BACKUP/RSYNC_TEST/
sudo rsync -ar --delete --exclude=/run/user/1000/gvfs/ /run    /BACKUP/RSYNC_TEST/
sudo rsync -ar --delete /sbin   /BACKUP/RSYNC_TEST/
sudo rsync -ar --delete /snap   /BACKUP/RSYNC_TEST/
sudo rsync -ar --delete /srv    /BACKUP/RSYNC_TEST/
sudo rsync -ar --delete /usr    /BACKUP/RSYNC_TEST/
sudo rsync -ar --delete /var    /BACKUP/RSYNC_TEST/
sudo rsync -ar --delete /initrd.img  /BACKUP/RSYNC_TEST/
sudo rsync -ar --delete /vmlinuz     /BACKUP/RSYNC_TEST/
