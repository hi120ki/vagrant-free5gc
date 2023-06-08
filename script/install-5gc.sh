#!/bin/bash -eu

cd $(dirname $0)

# Check Kernel version
KERNEL_VERSION=$(uname -r)
if [ ${KERNEL_VERSION:0:5} != "5.4.0" ]; then
  echo "Kernel version ${KERNEL_VERSION:0:5} is not supported"
  exit 1
fi

# Install Golang
rm -rf /usr/local/go
wget -q https://go.dev/dl/go1.14.4.linux-amd64.tar.gz -O /tmp/go1.14.4.linux-amd64.tar.gz
sudo tar -C /usr/local -xzf /tmp/go1.14.4.linux-amd64.tar.gz
mkdir -p ~/go/{bin,pkg,src}
echo 'export GOPATH=$HOME/go' >> ~/.bashrc
echo 'export GOROOT=/usr/local/go' >> ~/.bashrc
echo 'export PATH=$PATH:$GOPATH/bin:$GOROOT/bin' >> ~/.bashrc
echo 'export GO111MODULE=auto' >> ~/.bashrc

export GOPATH=$HOME/go
export GOROOT=/usr/local/go
export PATH=$PATH:$GOPATH/bin:$GOROOT/bin
export GO111MODULE=auto

# Check Kernel version
GO_VERSION=$(go version)
if [ ${GO_VERSION:13:6} != "1.14.4" ]; then
  echo "GO version ${GO_VERSION:13:6} is not supported"
  exit 1
fi

# Install mongodb
sudo apt -y update
sudo apt -y install mongodb wget git
sudo systemctl start mongodb

# Install dependencies
sudo apt -y update
sudo apt -y install git gcc g++ cmake autoconf libtool pkg-config libmnl-dev libyaml-dev

# Network config
sudo sysctl -w net.ipv4.ip_forward=1
sudo iptables -t nat -A POSTROUTING -o enp0s3 -j MASQUERADE
sudo iptables -A FORWARD -p tcp -m tcp --tcp-flags SYN,RST SYN -j TCPMSS --set-mss 1400
sudo systemctl stop ufw

# Install Node.js
sudo apt remove -y cmdtest
sudo apt remove -y yarn
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
sudo apt-get update
sudo apt-get install -y nodejs yarn

# Build free5gc
git clone --recursive -b v3.3.0 -j `nproc` https://github.com/free5gc/free5gc.git ~/free5gc
cd ~/free5gc ; make
cd ~/free5gc ; make webconsole

# Build and install gtp5g
git clone -b v0.8.1 https://github.com/free5gc/gtp5g.git ~/gtp5g
cd ~/gtp5g ; make ; sudo make install

# Add systemd daemon
sudo cp /vagrant/daemon/core.service /etc/systemd/system/core.service
sudo cp /vagrant/daemon/webconsole.service /etc/systemd/system/webconsole.service
sudo systemctl daemon-reload

# Apply free5gc patch
cd ~/free5gc ; git apply /vagrant/patch/free5gc.patch
