# -*- mode: ruby -*-
# vi: set ft=ruby :

  # Start Configuring Vagrantbox
Vagrant.configure(2) do |config|

  # Choose basic distribution for Vagrantbox
  config.vm.box = "precise32"

  # Give username and password for ssh access
  config.ssh.username = "vagrant"
  config.ssh.password = "vagrant"

  # Configure synced folder with 777 permissions for full accessD
  config.vm.synced_folder "./public", "/var/www/", :mount_options => ['dmode=777', 'fmode=777']

  # Config the hostname, ip and execute the script
  config.vm.define "lamp" do |lamp|
  	lamp.vm.hostname = "lamp"
  	lamp.vm.network "private_network", ip: "192.168.200.11"
  	lamp.vm.provision :shell, path: "script.sh"
  end
end
