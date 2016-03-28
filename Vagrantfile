# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://atlas.hashicorp.com/search.
  config.vm.box = "centos/7"

  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  # config.vm.box_check_update = false

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # config.vm.network "forwarded_port", guest: 80, host: 8080

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network "private_network", ip: "192.168.56.103"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"
  config.vm.synced_folder ".", "/home/vagrant/sync", disabled: true

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  config.vm.provider "virtualbox" do |vb|
    vb.gui = true
    vb.name = "ProbizmoStudy"
    vb.cpus = 2
    vb.memory = 2048
    vb.customize ["storageattach", :id, "--storagectl", "IDE Controller", "--port", 0, "--device", 1, "--type", "dvddrive", "--medium", "emptydrive"]
    vb.customize ["storageattach", :id, "--storagectl", "IDE Controller", "--port", 0, "--device", 1, "--type", "dvddrive", "--medium", "additions"]
  end
  #
  # View the documentation for the provider you are using for more
  # information on available options.

  # Define a Vagrant Push strategy for pushing to Atlas. Other push strategies
  # such as FTP and Heroku are also available. See the documentation at
  # https://docs.vagrantup.com/v2/push/atlas.html for more information.
  # config.push.define "atlas" do |push|
  #   push.app = "YOUR_ATLAS_USERNAME/YOUR_APPLICATION_NAME"
  # end

  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.

  # setup centos
  config.vm.provision "shell", inline: <<-SHELL
    sudo yum -y update
    sudo yum -y groupinstall "GNOME Desktop"
    sudo systemctl set-default graphical.target
    mkdir -p workspace/cleaning-duty
    mkdir -p workspace/cleaning-duty-web-client/dist
  SHELL

  # install guest additions
  config.vm.provision "shell", inline: <<-SHELL
    sudo yum -y groupinstall "Development tools"
    sudo mkdir /mnt/cdrom
    sudo mount /dev/cdrom /mnt/cdrom
    # 入力待ちになって処理が止まる…
    # sudo /mnt/cdrom/VBoxLinuxAdditions.run
  SHELL

  # pull docker images
  config.vm.provision "docker", images: ["postgres", "ruby", "node", "nginx"]

  # create docker containers
  config.vm.provision "shell", inline: <<-SHELL
    docker create --name postgres -e POSTGRES_PASSWORD=password postgres
    docker create --name cleaning-duty -i -t -v /home/vagrant/workspace/cleaning-duty:/workspace/cleaning-duty --privileged --link postgres:db --expose 3000 ruby /bin/bash
    docker create --name cleaning-duty-web-client -i -t -v /home/vagrant/workspace/cleaning-duty-web-client:/workspace/cleaning-duty-web-client --privileged node /bin/bash
    docker create --name nginx -v /home/vagrant/workspace/cleaning-duty-web-client/dist:/usr/share/nginx/html:ro --link cleaning-duty nginx
  SHELL

  # reboot for gui login
  config.vm.provision "shell", inline: "sudo shutdown -r now"

end
