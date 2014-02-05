# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure('2') do |config|
  config.vm.hostname = 'ruby_app'
  config.vm.box = 'ubuntu-12.04'
  config.vm.box_url = "http://opscode-vm-bento.s3.amazonaws.com/vagrant/virtualbox/opscode_#{config.vm.box}_chef-provisionerless.box"
  config.omnibus.chef_version = 'latest'
  config.berkshelf.enabled = true

  # if Vagrant.has_plugin?("vagrant-cachier")
    config.cache.auto_detect = true
    # If you are using VirtualBox, you might want to enable NFS for shared folders
    config.cache.enable_nfs  = true
  # end

  config.vm.provision :chef_solo do |chef|
    chef.json = {
    }

    chef.run_list = [
        'recipe[ruby_app::default]'
    ]
  end
end
