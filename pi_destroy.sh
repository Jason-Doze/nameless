#!/bin/bash

# Shutdown and exit Pi Server
sudo shutdown now && exit

# Delete fingerprint from localhost
# if (  ssh-keygen -H -F  ) # save ip in text file and use to delete fingerprint?
# then
#   echo -e "\n==== Deleting fingerprint from known host ====\n"
#   ssh-keygen ssh-keygen -f ~/.ssh/known_hosts -R # if ip saved in file, delete file also
# else
#   echo -e "\n==== Fingerprint not present in known host ====\n"
# fi  
