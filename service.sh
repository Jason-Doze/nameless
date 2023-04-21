#!/bin/bash

# This script copies the service file from expressapi repo to systemd/system directory.

# Copy service file and reload daemon
if [ -f /lib/systemd/system/api.service ] 
then
  echo -e "\n==== Service file present ====\n"
else 
  echo -e "\n==== Copying api.service ====\n"
  sudo cp /home/jasondoze/expressapi/api.service /etc/systemd/system/ && sudo systemctl daemon-reload
fi

# Restart express api.service
if ( systemctl is-active api.service ) 
then
  echo -e "\n==== Chuckie App running ====\n"
else 
  echo -e "\n==== Starting Chuckie App ====\n"
  sudo systemctl restart api.service
fi

echo -e "\n==== Install complete ====\n"

echo -e "\033[31m                                                                                 \033[0m"
echo -e "\033[31m   _________  .__                     __    .__                                  \033[0m"
echo -e "\033[31m   \_   ___ \ |  |__   __ __   ____  |  | __|__|  ____                           \033[0m"           
echo -e "\033[31m   /    \  \/ |  |  \ |  |  \_/ ___\ |  |/ /|  |_/ __ \                          \033[0m" 
echo -e "\033[31m   \     \____|   Y  \|  |  /\  \___ |    < |  |\  ___/                          \033[0m"   
echo -e "\033[31m    \______  /|___|  /|____/  \___  >|__|_ \|__| \___  >                         \033[0m"
echo -e "\033[31m           \/      \/             \/      \/         \/                          \033[0m"
echo -e "\033[31m                                                                                 \033[0m"

echo -e "\n\033[1m \033[32mIP Address:\033[0m \033[37m$( hostname -I | awk '{print $1}' ) \033[0m\n"