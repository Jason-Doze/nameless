#!/bin/bash

# This script will log in the address doze-pi.attlocal.net raspberry-pi ubuntu server, copy the files over, excute the script, and SSH into the server.

# Check if Pi server is up and running
while true
do
  if ( dig +short doze-pi.attlocal.net | grep -E '^[0-9\.]+$' > /dev/null )
  then
    echo -e "\n==== The server is running ====\n"
    ping -c 5 doze-pi.attlocal.net
    break
  else
    echo -e "\n==== The server is not running  ====\n"
    sleep 30
  fi
done

# Copy necessary files to Pi using Rsync
echo -e "==== Copying files to Pi ====\n"
rsync -av -e "ssh -o StrictHostKeyChecking=no -i ./ed25519" --delete --exclude={'.git','.gitignore','ed25519*'} $(pwd) jason@$( dig +short doze-pi.attlocal.net | grep -E '^[0-9\.]+$' ):/home/jason 

# Use SSH to execute commands on the Pi server
echo -e "\n==== Executing install script ====\n"
ssh -o StrictHostKeyChecking=no -i ./ed25519 jason@$( dig +short doze-pi.attlocal.net | grep -E '^[0-9\.]+$' ) 'cd nameless && bash nginx_install.sh'

# SSH into VM
echo -e "\n==== SSH into PI ====\n"
ssh -o StrictHostKeyChecking=no -i ./ed25519 jason@$( dig +short doze-pi.attlocal.net | grep -E '^[0-9\.]+$' )