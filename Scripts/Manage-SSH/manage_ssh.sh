#!/bin/bash
# Ver: 1.2
echo "What do you wan to do?"
echo "1 - Creating private and public RSA SSH keys"
echo "2 - Copy \"${USER}\" public key to remote server"
read choice
if [[ $choice == 1 ]]; then
    ssh-keygen -t rsa -q -f ~/.ssh/id_rsa -P ""
    touch ~/.ssh/authorized_keys && chmod 600 ~/.ssh/authorized_keys
elif [[ $choice == 2 ]]; then
    echo "Enter remote server IP address: " 
    read ip
    echo "Enter user name on remote server: " 
    read username
    cat ~/.ssh/id_rsa.pub | ssh ${username}@${ip} 'cat >> ~/.ssh/authorized_keys'
else
    echo "No valid choice. Quit!"
fi
