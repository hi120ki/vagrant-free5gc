#!/bin/bash -eu

cd $(dirname $0)

vagrant halt
vagrant destroy -f
vagrant up

vagrant ssh 5gc -c "bash /vagrant/script/install-5gc.sh"

vagrant ssh ueran -c "bash /vagrant/script/install-ueran.sh"

vagrant ssh 5gc -c "sudo systemctl start webconsole"

sleep 20

vagrant ssh 5gc -c "bash /vagrant/script/subscribe.sh"

vagrant ssh 5gc -c "sudo systemctl start core"

sleep 30

vagrant ssh ueran -c "sudo systemctl start gnb"

sleep 20

vagrant ssh ueran -c "sudo systemctl start ue"

sleep 10

vagrant ssh ueran -c "ping -c 10 -w 10 -I uesimtun0 8.8.8.8" | grep "0% packet loss"
