#!/bin/bash

# clones the api from github using HTTPS, install all deps

# Check for git and clone
if ( which git > /dev/null)
then 
  echo "git is present"
else  
  echo "install git"
  sudo apt install git
fi

# Clone the repo
if [ -d expressapi ] 
then
  echo -e "\n==== Repo already cloned ====\n"
else 
  echo -e "\n==== Cloning repo ====\n"
  git clone https://github.com/Jason-Doze/expressapi.git /home/jasondoze/expressapi
fi

# Install NodeJS 
if ( which nodejs > /dev/null ) 
then
  echo -e "\n==== NodeJS setup present ====\n"
else 
  echo -e "\n==== Installing NodeJS setup ====\n"
  curl -fsSL https://deb.nodesource.com/setup_19.x | sudo -E bash - 
  sudo apt install -y nodejs 
fi

# Install NPM and its dependencies
if [ -d node_modules ] 
then
  echo -e "\n==== Node_modules installed ====\n"
else 
  echo -e "\n==== Installing node_modules ====\n"
  cd /home/jasondoze/expressapi && npm install 
fi

# Copy service file and reload daemon
if [ -f /lib/systemd/system/api.service ] 
then
  echo -e "\n==== Service file present ====\n"
else 
  echo -e "\n==== Copying api.service ====\n"
  sudo cp /home/jasondoze/expressapi/api.service /lib/systemd/system/ && sudo systemctl daemon-reload

fi


# Restart the express api service
if ( systemctl is-active api.service ) 
then
  echo -e "\n==== Chucki running ====\n"
else 
  echo -e "\n==== Starting Chuckie ====\n"
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

