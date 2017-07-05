#!/bin/sh
sudo rsync -ar --delete /bin    /BACKUP/SNAPSHOTS/
sudo rsync -ar --delete /boot   /BACKUP/SNAPSHOTS/
sudo rsync -ar --delete /etc    /BACKUP/SNAPSHOTS/
sudo rsync -ar --delete /lib    /BACKUP/SNAPSHOTS/
sudo rsync -ar --delete /lib64  /BACKUP/SNAPSHOTS/
sudo rsync -ar --delete /opt    /BACKUP/SNAPSHOTS/
sudo rsync -ar --delete /root   /BACKUP/SNAPSHOTS/
sudo rsync -ar --delete --exclude=/run/user/1000/gvfs/ /run    /BACKUP/SNAPSHOTS/
sudo rsync -ar --delete /sbin   /BACKUP/SNAPSHOTS/
sudo rsync -ar --delete /srv    /BACKUP/SNAPSHOTS/
sudo rsync -ar --delete /usr    /BACKUP/SNAPSHOTS/
sudo rsync -ar --delete /var    /BACKUP/SNAPSHOTS/
sudo rsync -ar --delete /initrd.img  /BACKUP/SNAPSHOTS/
sudo rsync -ar --delete /vmlinuz     /BACKUP/SNAPSHOTS/
