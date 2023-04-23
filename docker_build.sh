#!/bin/bash

# Clone expressapi repository to the nameless directory
if [ -d /home/jasondoze/nameless/package.json ]
then
  echo -e "\n==== Expressapi app present ====\n"
else
  echo -e "\n==== Cloning expressapi repository to nameless directory ====\n"
  git clone https://github.com/Jason-Doze/expressapi.git 
fi

# Move the expressapi app to nameless directory and remove parent directory
echo -e "\n==== Move app into nameless directory and delete app parent directory ====\n"
mv /home/jasondoze/nameless/expressapi/* /home/jasondoze/nameless/
rm -rf /home/jasondoze/nameless/expressapi

echo -e "\n==== Build Docker image ====\n"
sudo docker build --no-cache --platform linux/arm64 -t namelessapi .

echo -e "\n==== Run Docker Container ====\n"
sudo docker run -p 3000:3000 -d --name namelessapi-container namelessapi





