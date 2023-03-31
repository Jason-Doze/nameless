#!/bin/bash

# This script will log in the address of a raspberry-pi 400 ubuntu server, copy the files over the Pi, excute the script, and SSH into the server.

echo "Validate Pi server is running\n"
while true
do
  if ( dig +short doze-pi.attlocal.net | grep -E '^[0-9\.]+$' > /dev/null )
  then
    echo -e "\n==== Server is running ====\n"
    ping -c 5 doze-pi.attlocal.net
    break
  else
    printf "\033[31m.\033[0m"
    sleep 5
  fi
done

# Copy necessary files to Pi using Rsync
echo -e "==== Copying files to Pi ====\n"
rsync -av -e "ssh -o StrictHostKeyChecking=no -i ./ed25519" --delete --exclude={'.git','.gitignore','ed25519*'} $(pwd) jason@$( dig +short doze-pi.attlocal.net | grep -E '^[0-9\.]+$' ):/home/jason 

# Use SSH to execute commands on the Pi server
# echo -e "\n==== Executing install script ====\n"
# ssh -o StrictHostKeyChecking=no -i ./ed25519 jason@$( dig +short doze-pi.attlocal.net | grep -E '^[0-9\.]+$' ) 'cd nameless && bash nginx_install.sh' # && api deploy and the vhost 

# SSH into VM
echo -e "\n==== SSH into Pi ====\n"
ssh -o StrictHostKeyChecking=no -i ./ed25519 jason@$( dig +short doze-pi.attlocal.net | grep -E '^[0-9\.]+$' )