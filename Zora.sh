#!/bin/bash

# Function to check if a command executed successfully
check_command() {
    if [ $? -ne 0 ]; then
        echo "Error executing command. Exiting..."
        exit 1
    fi
}

# Update and upgrade packages
sudo apt-get update && sudo apt-get upgrade -y
check_command

# Install necessary packages
sudo apt install curl build-essential git screen jq pkg-config libssl-dev libclang-dev ca-certificates gnupg lsb-release -y
check_command

# Set up Docker repository
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
check_command

# Install Docker
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose -y
check_command

# Clone repository and set up configuration
git clone https://github.com/conduitxyz/node.git
check_command
cd node
./download-config.py zora-mainnet-0
check_command
export CONDUIT_NETWORK=zora-mainnet-0
cp .env.example .env

echo "Installation completed successfully."
