Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/focal64"
  config.vm.box_version = "20230823.0.0"

  if Vagrant.has_plugin?("vagrant-vbguest")
    config.vbguest.auto_update = false
  end

  config.vm.define "5gc" do |server|
    server.vm.hostname = "5gc"
    server.vm.network "private_network", ip: "192.168.56.101", virtualbox__intnet: "intnet"
  end

  config.vm.define "ueran" do |server|
    server.vm.hostname = "ueran"
    server.vm.network "private_network", ip: "192.168.56.102", virtualbox__intnet: "intnet"
  end
end
