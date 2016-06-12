# ilsh_backup

### This KSH script creates a tar.gz backup file for choosing dirs\files and FTP\SCP it to remote server
#### Before running the script fill it's internal configurable variables:
    $ BACKUP_NAME='TEST_BACKUP' # The desire backup filename
    $ BACKUP_LIST='/dir1 /dir2 /dir3/filename1 /dir2/filename2' # Dirs and filenames to backup
    $ BACKUP_DIR='WHERE_TO_STORE_THE_BACKUP' # Where to store the backup file
    $ EXCLUDE_LIST='n' # enter 'y'\'no' if you want to relate to 'exclude.txt' file (contain exclude list of files\dirs)
    $
    $ UPLOAD_TO_FTP_SERVER='y' # enter 'y'\'no' if you want to upload the backup file to remote FTP server
    $ HOST='IP_ADDRESS' # FTP Server IP address
    $ USERNAME='FTP_USERNAME' # FTP Server username
    $ PASSWORD='FTP_PASSWORD' # FTP Server password
    $ FTP_DIR='FTP_DIR' # FTP server remote backup dir
    $
    $ UPLOAD_TO_SSH_SERVER='n'  # enter 'y'\'no' if you want to copy the backup file to remote SSH server
    $ SSH_SERVER='IP_ADDRESS'   # SSH IP adress
    $ SSH_USERNAME='SSH_USERNAME' # SSH username
    $ SSH_DIR='SSH_DIR' # Remote dir in SSH server
 
- The backup filename include the backup timestamp: BACKUP_NAME-YYYYMMDD-HHSS 
- ilsh_backup needs passwordless SCP connection
- In HP-UX dir there is a special version for hp-ux platrorm called backupNftp.ksh
