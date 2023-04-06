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

echo "                                                                                                         "
echo "  _________                                       _____                                           .__    "
echo "  \_   ___ \ _______   ____  __  _  __  ____     /  _  \  ______  ______  _____   _______   ____  |  |   "
echo "  /    \  \/ \_  __ \ /  _ \ \ \/ \/ / /    \   /  /_\  \ \____ \ \____ \ \__  \  \_  __ \_/ __ \ |  |   "
echo "  \     \____ |  | \/(  <_> ) \     / |   |  \ /    |    \|  |_> >|  |_> > / __ \_ |  | \/\  ___/ |  |__ "
echo "   \______  / |__|    \____/   \/\_/  |___|  / \____|__  /|   __/ |   __/ (____  / |__|    \___  >|____/ "
echo "          \/                               \/          \/ |__|    |__|         \/              \/        "