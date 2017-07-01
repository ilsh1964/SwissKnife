#!/bin/sh
sudo rsync -ar --delete /BACKUP/RSYNC_TEST/bin/     /bin/
sudo rsync -ar --delete /BACKUP/RSYNC_TEST/boot/    /boot/
sudo rsync -ar --delete /BACKUP/RSYNC_TEST/etc/     /etc/
sudo rsync -ar --delete /BACKUP/RSYNC_TEST/lib/     /lib/
sudo rsync -ar --delete /BACKUP/RSYNC_TEST/lib64/   /lib64/
sudo rsync -ar --delete /BACKUP/RSYNC_TEST/opt/     /opt/
sudo rsync -ar --delete /BACKUP/RSYNC_TEST/root/    /root/
#sudo rsync -ar --delete --exclude=/run/user/1000/gvfs/  /BACKUP/RSYNC_TEST/run/  /run/
sudo rsync -ar --delete /BACKUP/RSYNC_TEST/sbin/     /sbin/
sudo rsync -ar --delete /BACKUP/RSYNC_TEST/snap/     /snap/
sudo rsync -ar --delete /BACKUP/RSYNC_TEST/srv/      /srv/
sudo rsync -ar --delete /BACKUP/RSYNC_TEST/usr/      /usr/
sudo rsync -ar --delete /BACKUP/RSYNC_TEST/var/      /var/
sudo rsync -ar --delete /BACKUP/RSYNC_TEST/initrd.img    /initrd.img
sudo rsync -ar --delete /BACKUP/RSYNC_TEST/vmlinuz  /vmlinuz
