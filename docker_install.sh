#!/bin/bash

# This script installs Docker, copies the Dockerfile to the expressapi node app directory, builds and runs the Docker container.
# Install Docker
if ( which docker > /dev/null )
then
  echo -e "\n==== Docker present ====\n"
else
  echo -e "\n==== Installing Docker ====\n"
  sudo mkdir -p /etc/apt/keyrings
  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
  echo -e "\n==== Setting up Docker repo ====\n"
  echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
  echo -e "\n==== Installing Docker engine and updating apt package ====\n"
  sudo apt update
  sudo apt install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin
fi


