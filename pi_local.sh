#!/bin/bash

# This script will log in the address of a raspberry-pi 400 ubuntu server, copy the files over the Pi, excute the script, and SSH into the server.

echo -e "\n==== Validate Pi server is running ====\n"
while true
do
  if (  host -t A raspberry | grep -oE '([0-9]{1,3}\.){3}[0-9]{1,3}' )
  then
    echo -e "\n==== Server is running  ====\n"
    break
  else
    printf "\033[31m.\033[0m"
    sleep 5
  fi
done

# Use rsync to copy files to the Pi server
echo -e "\n==== Copying files to Pi ====\n"
rsync -av -e "ssh -o StrictHostKeyChecking=no -i ./id_ed25519" --delete --exclude={'.git','.gitignore','id_ed25519*','commands.txt','images','README.md'} $(pwd) $USER@$( host -t A raspberry | grep -oE '([0-9]{1,3}\.){3}[0-9]{1,3}'):/home/jasondoze

# Use SSH to execute commands on the Pi server
echo -e "\n==== Executing install script ====\n"
ssh -o StrictHostKeyChecking=no -i ./id_ed25519 $USER@$( host -t A raspberry | grep -oE '([0-9]{1,3}\.){3}[0-9]{1,3}') 'cd nameless && bash nginx_install.sh && bash api_deploy.sh'

# SSH into Pi server
echo -e "\n==== SSH into Pi ====\n"
ssh -o StrictHostKeyChecking=no -i ./id_ed25519 $USER@$( host -t A raspberry | grep -oE '([0-9]{1,3}\.){3}[0-9]{1,3}')
