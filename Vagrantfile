# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = '2'

Vagrant.configure(VAGRANTFILE_API_VERSION) do |main_config|
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.

  main_config.hostsupdater.remove_on_suspend = false

  main_config.vm.define 'db' do |config|
    # Every Vagrant virtual environment requires a box to build off of.
    config.vm.box = 'ubuntu/trusty64'

    # Create a forwarded port mapping which allows access to a specific port
    # within the machine from a port on the host machine. In the example below,
    # accessing "localhost:8080" will access port 80 on the guest machine.
    # config.vm.network 'forwarded_port', guest: 80, host: 8181
    # config.vm.network 'forwarded_port', guest: 9393, host: 9191

    # Create a private network, which allows host-only access to the machine
    # using a specific IP.
    config.vm.network :private_network, ip: '192.168.30.14'
    config.vm.hostname = "db.groc.vm"
    config.vm.provision :hosts do |provisioner|
      provisioner.autoconfigure = true
      provisioner.sync_hosts = true
      provisioner.add_host '192.168.30.16', ['dev.groc.vm']
    end

    # Create a public network, which generally matched to bridged network.
    # Bridged networks make the machine appear as another physical device on
    # your network.
    # config.vm.network "public_network"

    # If true, then any SSH connections made will enable agent forwarding.
    # Default value: false
    config.ssh.forward_agent = true

    # Share an additional folder to the guest VM. The first argument is
    # the path on the host to the actual folder. The second argument is
    # the path on the guest to mount the folder. And the optional third
    # argument is a set of non-required options.
    # config.vm.synced_folder "../data", "/vagrant_data"

    # Provider-specific configuration so you can fine-tune various
    # backing providers for Vagrant. These expose provider-specific options.
    # Example for VirtualBox:
    #
    config.vm.provider 'virtualbox' do |v|
      # Don't boot with headless mode
      # vb.gui = true

      # Use VBoxManage to customize the VM. For example to change memory:
      v.memory = 256
    end
  end

  main_config.vm.define 'web' do |config|
    # Every Vagrant virtual environment requires a box to build off of.
    config.vm.box = 'ubuntu/xenial64'


    # Create a forwarded port mapping which allows access to a specific port
    # within the machine from a port on the host machine. In the example below,
    # accessing "localhost:8080" will access port 80 on the guest machine.
    # config.vm.network 'forwarded_port', guest: 80, host: 8181
    # config.vm.network 'forwarded_port', guest: 9393, host: 9191

    # Create a private network, which allows host-only access to the machine
    # using a specific IP.
    config.vm.network :private_network, ip: '192.168.30.16'
    config.vm.hostname = "www.groc.vm"
    config.hostsupdater.aliases = ["dev.groc.vm"]
    config.vm.provision :hosts do |provisioner|
      provisioner.autoconfigure = true
      provisioner.sync_hosts = true
      provisioner.add_host '192.168.30.16', ['dev.groc.vm']
    end

    # Create a public network, which generally matched to bridged network.
    # Bridged networks make the machine appear as another physical device on
    # your network.
    # config.vm.network "public_network"
    # config.vm.synced_folder __dir__ + '/../www', '/vagrant'

    # If true, then any SSH connections made will enable agent forwarding.
    # Default value: false
    config.ssh.forward_agent = true

    # Share an additional folder to the guest VM. The first argument is
    # the path on the host to the actual folder. The second argument is
    # the path on the guest to mount the folder. And the optional third
    # argument is a set of non-required options.
    # config.vm.synced_folder "../data", "/vagrant_data"

    # Provider-specific configuration so you can fine-tune various
    # backing providers for Vagrant. These expose provider-specific options.
    # Example for VirtualBox:
    #
    config.vm.provider 'virtualbox' do |v|
      v.name = "www-infrastructure-web"
      # Don't boot with headless mode
      # vb.gui = true

      # Use VBoxManage to customize the VM. For example to change memory:
      v.memory = 512
    end
  end

  main_config.vm.define 'app2' do |config|
    # Every Vagrant virtual environment requires a box to build off of.
    config.vm.box = 'ubuntu/xenial64'

    # Create a forwarded port mapping which allows access to a specific port
    # within the machine from a port on the host machine. In the example below,
    # accessing "localhost:8080" will access port 80 on the guest machine.
    # config.vm.network 'forwarded_port', guest: 80, host: 8181
    # config.vm.network 'forwarded_port', guest: 9393, host: 9191

    # Create a private network, which allows host-only access to the machine
    # using a specific IP.
    config.vm.network :private_network, ip: '192.168.30.17'
    config.vm.hostname = "app2.groc.vm"
    config.vm.provision :hosts do |provisioner|
      provisioner.autoconfigure = true
      provisioner.sync_hosts = true
    end

    # Create a public network, which generally matched to bridged network.
    # Bridged networks make the machine appear as another physical device on
    # your network.
    # config.vm.network "public_network"
    # config.vm.synced_folder __dir__ + '/../www', '/vagrant'

    # If true, then any SSH connections made will enable agent forwarding.
    # Default value: false
    # config.ssh.forward_agent = true

    # Share an additional folder to the guest VM. The first argument is
    # the path on the host to the actual folder. The second argument is
    # the path on the guest to mount the folder. And the optional third
    # argument is a set of non-required options.
    # config.vm.synced_folder "../data", "/vagrant_data"

    # Provider-specific configuration so you can fine-tune various
    # backing providers for Vagrant. These expose provider-specific options.
    # Example for VirtualBox:
    #
    config.vm.provider 'virtualbox' do |v|
      v.name = "www-infrastructure-app2"
      # Don't boot with headless mode
      # vb.gui = true

      # Use VBoxManage to customize the VM. For example to change memory:
      v.memory = 512
    end
  end


  main_config.vm.define 'app', primary: true do |config|
    # Every Vagrant virtual environment requires a box to build off of.
    config.vm.box = 'ubuntu/xenial64'

    # Create a forwarded port mapping which allows access to a specific port
    # within the machine from a port on the host machine. In the example below,
    # accessing "localhost:8080" will access port 80 on the guest machine.
    # config.vm.network 'forwarded_port', guest: 80, host: 8181
    # config.vm.network 'forwarded_port', guest: 9393, host: 9191

    # Create a private network, which allows host-only access to the machine
    # using a specific IP.
    config.vm.network :private_network, ip: '192.168.30.15'
    config.vm.hostname = "app.groc.vm"
    config.vm.provision :hosts do |provisioner|
      provisioner.autoconfigure = true
      provisioner.sync_hosts = true
      provisioner.add_host '192.168.30.16', ['dev.groc.vm']
    end

    # Create a public network, which generally matched to bridged network.
    # Bridged networks make the machine appear as another physical device on
    # your network.
    # config.vm.network "public_network"
    config.vm.synced_folder __dir__ + '/../www', '/vagrant'

    # If true, then any SSH connections made will enable agent forwarding.
    # Default value: false
    config.ssh.forward_agent = true

    # Share an additional folder to the guest VM. The first argument is
    # the path on the host to the actual folder. The second argument is
    # the path on the guest to mount the folder. And the optional third
    # argument is a set of non-required options.
    # config.vm.synced_folder "../data", "/vagrant_data"

    # Provider-specific configuration so you can fine-tune various
    # backing providers for Vagrant. These expose provider-specific options.
    # Example for VirtualBox:
    #
    config.vm.provider 'virtualbox' do |v|
      v.name = "www-infrastructure-app"
      # Don't boot with headless mode
      # vb.gui = true

      # Use VBoxManage to customize the VM. For example to change memory:
      v.memory = 512 * 4
      # Give 2 cpu cores on the host
      v.customize ['modifyvm', :id, '--ioapic', 'on']
      v.cpus = 2
    end
  end

  # This should already be in the box.
  main_config.vm.provision "shell", inline: 'apt-get -qq install python python-pycurl python-apt'

  main_config.vm.provision 'ansible' do |ansible|
    ansible.playbook = 'ansible/vagrant.yml'
    ansible.verbose = 'vv'
  end
end
