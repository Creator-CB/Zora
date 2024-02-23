
#!/bin/bash


bash <(curl -s https://raw.githubusercontent.com/Creator-CB/FILES/main/TDM-Crypto.sh)

sudo apt-get update && sudo apt-get upgrade -y

sudo apt install curl build-essential git screen jq pkg-config libssl-dev libclang-dev ca-certificates gnupg lsb-release -y


sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo chmod a+r /etc/apt/keyrings/docker.gpg


sudo apt-get update


sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose -y

git clone https://github.com/conduitxyz/node.git
cd node || exit 1 
./download-config.py zora-mainnet-0 || exit 1  
export CONDUIT_NETWORK=zora-mainnet-0
cp .env.example .env || exit 1 
