# -*- mode: ruby -*-
# vi: set ft=ruby :
require 'berkshelf/vagrant'

Vagrant::Config.run do |config|
  config.vm.box = "Berkshelf-CentOS-6.3-x86_64-minimal"
  config.vm.box_url = "https://dl.dropbox.com/u/31081437/Berkshelf-CentOS-6.3-x86_64-minimal.box"

  config.vm.provision :chef_solo do |chef|
    chef.json = {
      'perl' => {
        'version' => '5.16.3',
        'prefix'  => '/usr/local/bin/perl-5.16.3',
      },
      'ruby' => {
        'version' => '1.9.3-p392',
        'prefix'  => '/usr/local/bin/ruby-1.9.3',
      },
      'php' => {
        'version' => '5.5snapshot',
        'prefix'  => '/usr/local/bin/php-5.5snapshot',
        'options' => '--with-pear',
      },
      'python' => {
        'version' => '2.7.3',
        'prefix'  => '/usr/local/bin/python-2.7.3',
      },
      'node' => {
        'version' => 'v0.10.1',
        'prefix'  => '/usr/local/bin/node-0.10.1',
      },
    }
    chef.run_list = [
      "recipe[xbuild::default]",
      "recipe[xbuild::test]"
    ]
  end
end
