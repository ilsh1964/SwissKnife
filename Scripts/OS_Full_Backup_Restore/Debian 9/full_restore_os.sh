#!/bin/sh
sudo rsync -ar --delete /BACKUP/SNAPSHOTS/bin/     /bin/
sudo rsync -ar --delete /BACKUP/SNAPSHOTS/boot/    /boot/
sudo rsync -ar --delete /BACKUP/SNAPSHOTS/etc/     /etc/
sudo rsync -ar --delete /BACKUP/SNAPSHOTS/lib/     /lib/
sudo rsync -ar --delete /BACKUP/SNAPSHOTS/lib64/   /lib64/
sudo rsync -ar --delete /BACKUP/SNAPSHOTS/opt/     /opt/
sudo rsync -ar --delete /BACKUP/SNAPSHOTS/root/    /root/
#sudo rsync -ar --delete --exclude=/run/user/1000/gvfs/  /BACKUP/SNAPSHOTS/run/  /run/
sudo rsync -ar --delete /BACKUP/SNAPSHOTS/sbin/     /sbin/
sudo rsync -ar --delete /BACKUP/SNAPSHOTS/snap/     /snap/
sudo rsync -ar --delete /BACKUP/SNAPSHOTS/srv/      /srv/
sudo rsync -ar --delete /BACKUP/SNAPSHOTS/usr/      /usr/
sudo rsync -ar --delete /BACKUP/SNAPSHOTS/var/      /var/
sudo rsync -ar --delete /BACKUP/SNAPSHOTS/initrd.img    /initrd.img
sudo rsync -ar --delete /BACKUP/SNAPSHOTS/vmlinuz  /vmlinuz
