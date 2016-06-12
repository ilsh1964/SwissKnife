#!/usr/bin/ksh
#
# This script backup choosen files and dirs (tar), and upload the tar file to FTP server
# REMARKS:
#        1. Don't forget to FILL ALL envirnoment variables
#        2. This script is for hp-ux platform
#
# Ver: 1.0
# Developer: ilan.shavit@gmail.com
#
DATE=$(date +%Y%m%d-%H%M%S) 
FILENAME=DESIRE_FILENAME_PREFIX-${DATE}.tar                                       # Fill DESIRE_FILENAME_PREFIX 
HOSTNAME=IP_ADDRESS                                                               # Fill HOSTNAME
FTP_USER=FTP_USERNAME                                                             # Fill FTP USERNAME
FTP_PASS=FTP_PASSWORD                                                             # Fill FTP PASSWORD
LOCAL_DIR=DESIRE_LOCAL_DIR                                                        # Fill LOCAL DIR
REMOTE_FTP_DIR=DESIRE_REMOTE_FTP_DIR                                              # Fill REMOTE FTP DIR
LIST_OF_DIR_AND_FILESNAMES_TO_BACKUP=ALL_DIRS_AND_FILENSAMES_SEPARATE_BY_SPACE  # Fill ALL DIRS AND FILENSAMES SEPARATE BY SPACE
cd $LOCAL_DIR
tar cf $FILENAME LIST_OF_DIR_AND_FILESNAMES_TO_BACKUP
ftp -in $HOSTNAME <<EOF
user $FTP_USER $FTP_PASS
binary
cd REMOTE_FTP_DIR
put $FILENAME
EOF
rm $FILENAME
