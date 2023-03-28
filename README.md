# Raspberry Pi Deployment Script
This script logs in to a Raspberry Pi server, copies necessary files using Rsync, executes an install script, and SSH's into the server.

## Usage
Clone this repository to your local machine.
Make sure you have SSH access to the Raspberry Pi server.
Run the script using the following command:
```shell
bash pi_deploy.sh
```

## Requirements
Bash version 4 or later.
SSH access to the Raspberry Pi server.
Rsync installed on the local machine.
The ed25519 SSH key in the nameless directory.


