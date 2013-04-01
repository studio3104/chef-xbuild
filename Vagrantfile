# -*- mode: ruby -*-
# vi: set ft=ruby :
require 'berkshelf/vagrant'

Vagrant::Config.run do |config|
  config.vm.box = "Berkshelf-CentOS-6.3-x86_64-minimal"
  config.vm.box_url = "https://dl.dropbox.com/u/31081437/Berkshelf-CentOS-6.3-x86_64-minimal.box"

  config.vm.provision :chef_solo do |chef|
    chef.run_list = [
      "recipe[xbuild::default]",
      "recipe[xbuild::test]"
    ]
  end
end
