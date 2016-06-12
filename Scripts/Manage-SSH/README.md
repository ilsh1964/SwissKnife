# Manage-SSH (Ver: 1.2)

## To create a new pair of RSA certificate run:
    $ bash manage_ssh.sh 
    $ choose 1                    

## To copy the current user public key to user@server run:
    $ bash manage_ssh.sh 
    $ choose 2
    $ Enter remote Server IP address 
    $ Enter user name on remote Server 

## Remarks:
#### In case of problem with connection without password to remote host check this issue:
- Verify the following permissions: .ssh dir:700, id_rsa:600, id_rsa.pub:644, authorized_keys:600
- Verify in /etc/sshd_config: 'AuthorizedKeyFile=.ssh/authorized_keys' 
- In case of getting an error msg "Agent admitted failure to sign using the key" run the following command to fix it
   $ ssh-add
