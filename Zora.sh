#!/bin/bash
bash <(curl -s https://raw.githubusercontent.com/Creator-CB/FILES/main/TDM-Crypto.sh)

# Command 1
sudo apt-get update && sudo apt-get upgrade -y

# Command 2
sudo apt install curl build-essential git screen jq pkg-config libssl-dev libclang-dev ca-certificates gnupg lsb-release -y

# Command 3
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

# Command 4
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update

# Command 5
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose -y

# Command 6
git clone https://github.com/conduitxyz/node.git

# Command 7
cd node || exit 1  # Exit if directory change fails

# Command 8
./download-config.py zora-mainnet-0 || exit 1  # Exit if config download fails

# Command 9
export CONDUIT_NETWORK=zora-mainnet-0

# Command 10
cp .env.example .env

# Open .env file for editing using nano
nano .env
