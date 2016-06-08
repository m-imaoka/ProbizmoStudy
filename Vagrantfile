# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "centos/7"

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # config.vm.network "forwarded_port", guest: 80, host: 8080

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  config.vm.network "private_network", ip: "192.168.56.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  config.vm.synced_folder ".", "/home/vagrant/sync", type: "virtualbox"

  config.vm.provider "virtualbox" do |vb|
    # vb.gui = true
    vb.cpus = 2
    vb.memory = 2048
    vb.customize ["storageattach", :id, "--storagectl", "IDE Controller", "--port", 0, "--device", 1, "--type", "dvddrive", "--medium", "emptydrive"]
  end
  
  config.vm.provision "shell", path: "provision.sh"
end
