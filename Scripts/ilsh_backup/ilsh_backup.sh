#!/usr/bin/ksh
# ilsh_backup: Ver 1.1
# Developer: ilan.shavit@gmail.com  



# BACKUP CONFIG VARIABLES:
##########################
# - Update the following variables: BACKUP_NAME, BACKUP_LIST, BACKUP_DIR
# - If you want to include exclude list update EXCLUDE_LIST='y' and update the exclude.txt file 
BACKUP_NAME='TEST_BACKUP'
BACKUP_LIST='/dir1 /dir2 /dir3/filename1 /dir2/filename2'
BACKUP_DIR='WHERE_TO_STORE_THE_BACKUP'
EXCLUDE_LIST='n'



# FTP CONFIG VARIABLES:
#######################
# - Complete the correct values in: HOST,USERNAME,PASSWORD & DIR_FTP
# - If you want to upload the backup file to FTP server update UPLOAD_TO_FTP_SERVER='y'
UPLOAD_TO_FTP_SERVER='n'
HOST='IP_ADDRESS'
USERNAME='FTP_USERNAME'
PASSWORD='FTP_PASSWORD'
FTP_DIR='FTP_DIR'



# SCP CONFIG VARIABLES:
#######################
# - Complete the correct values in: SSH_SERVER & SSH_DIR
# - If you want to scp the backup file to SSH server update UPLOAD_TO_SSH_SERVER='y'
UPLOAD_TO_SSH_SERVER='n'
SSH_SERVER='IP_ADDRESS'
SSH_USERNAME='SSH_USERNAME'
SSH_DIR='SSH_DIR'





##################################################################
# THE SCRIPT START HERE. DON'T CHANGE VALUES FROM THIS POINT...!!!
##################################################################
TS=$(date  +%Y%m%d-%H%M%S)
FILENAME=${BACKUP_NAME}-${TS}.tar.gz

if [[ $EXCLUDE_LIST = 'y' ]]; then
    tar -pczf  ${BACKUP_DIR}/$FILENAME -X exclude.txt $BACKUP_LIST 
else
    tar -pczf  ${BACKUP_DIR}/$FILENAME $BACKUP_LIST 
fi

if [[ "$UPLOAD_TO_FTP_SERVER" = 'y' ]]; then
ftp -nv $HOST <<EOF
user $USERNAME $PASSWORD
cd $FTP_DIR
binary
put ${BACKUP_DIR}/$FILENAME $FILENAME
bye
EOF
fi

if [[ $UPLOAD_TO_SSH_SERVER = 'y' ]]; then
    scp ${BACKUP_DIR}/$FILENAME ${SSH_USERNAME}@${SSH_SERVER}:/$SSH_DIR/
fi
exit 0
