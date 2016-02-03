# -*- mode: ruby -*-
# vi: set ft=ruby :
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://atlas.hashicorp.com/search.

Vagrant.configure(2) do |config|
  config.vm.box = "precise32"
  config.ssh.username = "vagrant"
  config.ssh.password = "vagrant"
  config.vm.synced_folder "./public", "/var/www/", :mount_options => ['dmode=777', 'fmode=777']
  config.vm.define "lamp" do |lamp|
  	lamp.vm.hostname = "lamp"
  	lamp.vm.network "private_network", ip: "192.168.200.11"
  	lamp.vm.provision :shell, path: "script.sh"
  end
end
