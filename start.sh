#!/bin/bash
#for Debian based
sudo apt-get update
sudo apt-get install -y \
     apt-transport-https \
     ca-certificates \
     curl \
     gnupg2 \
     software-properties-common
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/debian \
   $(lsb_release -cs) \
   stable"
sudo apt-get update && sudo apt-get upgrade && sudo apt-get install -y docker-ce

#CRONTAB
#wget GIT/reboot_cron -O /tmp/reboot_cron
#sudo crontab -u root /tmp/reboot_cron

wallet='G7qy9R6wP7dbTR81WnCtsri2pqbQE25wK6VYxJsrLjip3pbYfeF1WP624fdacomgRj7q5E93XFK8DQCMcNHjfeBCP6jSpwS.ede44a8126890ed097414e9814d714b36b1da1eaef906d4bc3e2a24cb95fc777'
wallet2='<wallet>'
numthr="$(nproc --all)"
pool='graft.miner.rocks'
port=4005
pass='w=miner'

image=servethehome/universal_cryptonight:latest
docker run -itd -e pool=${pool} -e startport=${port} -e username=${wallet} -e pass=${pass} -e donate-level=1 -e numthreads=$((numthr)) ${image}
