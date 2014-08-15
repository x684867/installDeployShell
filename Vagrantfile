#
# vagrantFile for deployShell development
# (c) 2014 Sam Caldwell.  MIT License
#
# This file deploys a working deployshell setup.
#

# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
	i=Time.now.to_i
	
	#config.vm.guest = :linux
	config.vm.hostname="deployShell-#{i}"
	config.vm.network "public_network", bridge:'en1'
	config.vm.box = "parallels/ubuntu-12.04"
	config.vm.box_check_update = false
	
	config.vm.provider "parallels" do |v|
		v.update_guest_tools=false
		v.check_guest_tools=false
		v.optimize_power_consumption = false
		v.cpus = 2
		v.memory = 512
		v.name="deployShell-#{i}"
	end

	# SSH config
	config.ssh.forward_agent=false
	config.ssh.forward_x11=false

	#Perform the basic system setup.
	config.vm.provision "shell",path:"./vagrant/setup.sh"
	config.vm.provision "shell",path:"./vagrant/hardenSSH.sh"
	config.vm.provision "shell",path:"./vagrant/configureFirewall.sh"
	#config.vm.provision :reboot

	#Perform the final deployment.
	config.vm.provision "shell",path:"./vagrant/deployShell.sh"
	
end
