#!/usr/bin/env bash

#for Debian based
sudo sysctl vm.nr_hugepages=128
sudo apt-get update
sudo apt-get upgrade -y
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
sudo apt-get update && sudo apt-get install -y docker-ce

#CRONTAB
#wget GIT/reboot_cron -O /tmp/reboot_cron
#sudo crontab -u root /tmp/reboot_cron

wallet='46XYFkrVGBjUjFS891F17uivxsijPnen18WmBKdrgUWzjoVPyQFduYzQwAK61ox5oZK5QmhBRqK5cF8gJ1HC69R6M3NdQkY'
numthr="$(nproc --all)"
pool='ca.minexmr.com'
port=4444
pass='x'
ID="$(hostname)"

image=servethehome/universal_cryptonight:latest
docker run -itd -e pool=${pool} -e startport=${port} -e username=${wallet}.${ID} -e pass=${pass} -e donate-level=1 -e numthreads=$((numthr)) ${image}
