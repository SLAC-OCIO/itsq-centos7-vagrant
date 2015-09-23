# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|
  config.vm.box = "lamudi/centos-7.0"

    if !Vagrant.has_plugin?('vagrant-cachier')
        puts "The vagrant-cachier plugin is required. Please install it with \"vagrant plugin install vagrant-cachier\""
        exits
    end

    if !Vagrant.has_plugin?('vagrant-hostmanager')
        puts "The vagrant-hostmanager plugin is required. Please install it with \"vagrant plugin install vagrant-hostmanager\""
        exit
    end

  # set cache scope for cachier
    config.cache.scope = :box

    config.vm.provider "virtualbox" do |vb|
        vb.customize ["modifyvm", :id, "--memory", 2048]
        vb.customize ["modifyvm", :id, "--cpus", 2]
    end

  # vagrant-hostmanager config (https://github.com/smdahlen/vagrant-hostmanager)
    config.hostmanager.enabled = true
    config.hostmanager.manage_host = true
    config.hostmanager.ignore_private_ip = false
    config.hostmanager.include_offline = true
 #if Using the lamp stack, uncomment the 
    config.vm.define "=SLAC DevBox=" do |node|
        # dns name in VM and Host
        node.vm.hostname = 'www.project1.dev'
        # set a dedicated ip
        node.vm.network :private_network, ip: '192.168.13.37'
        node.hostmanager.aliases = %w(www.project1.dev www.project2.dev)
        #lamp (mysql) port
	    #config.vm.network :forwarded_port, guest: 3306, host: 3308
        #meteor port
        config.vm.network :forwarded_port, guest: 3005, host: 3005
    end

   # config.omnibus.chef_version = :latest

    config.vm.synced_folder ".", "/home/vagrant", :owner => "vagrant", :group => "vagrant"
    #config.vm.synced_folder "./app", "/var/app", :owner => "vagrant", :group => "users"

    # If true, then any SSH connections made will enable agent forwarding.
    # Default value: false
    config.ssh.forward_agent = true

    # chef solo part
    config.vm.provision :chef_zero do |chef|
    chef.cookbooks_path = ["chef/cookbooks/"]
        #--------------------------------------------------------------------
        #if you wish to utilize lamp stack uncomment lamp, nginx and php-fpm 
        #and comment out meteor related instructions
        #--------------------------------------------------------------------
        #chef.add_recipe "lamp"
        #chef.add_recipe "php-fpm"
        chef.add_recipe "nodejs::install_from_package"
        chef.add_recipe "meteor"        
        chef.add_recipe "purejs"
        chef.add_recipe "bundler"
        chef.json = {  
            #:lamp  => {
            #    vhosts: [ "project1.dev", "project2.dev" ]
            #},
            #:nginx => {
            #    default_site_enabled: false,
            #    sendfile: "off",
            #    default_root: "/vagrant",
            #    listen: "unix:/var/run/php-fpm-www.sock",
            #    user: "vagrant",
            #    group: "vagrant",
            #},
            #:'php-fpm' => {
            #    user: "vagrant",
            #    group: "vagrant"
            #},

            :'meteor' => {
                user: "meteor",
                group: "users"
            }
        }

    end
end
