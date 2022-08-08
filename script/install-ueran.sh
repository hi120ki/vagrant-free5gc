#!/bin/bash -eu

cd $(dirname $0)

sudo apt update
sudo apt install -y make gcc g++ libsctp-dev lksctp-tools iproute2
sudo apt remove -y cmake
sudo snap install cmake --classic

git clone -b v3.2.6 https://github.com/aligungr/UERANSIM.git ~/UERANSIM
cd ~/UERANSIM ; make

sudo cp /vagrant/daemon/gnb.service /etc/systemd/system/gnb.service
sudo cp /vagrant/daemon/ue.service /etc/systemd/system/ue.service
sudo systemctl daemon-reload

cd ~/UERANSIM ; git apply /vagrant/patch/ueransim.patch
