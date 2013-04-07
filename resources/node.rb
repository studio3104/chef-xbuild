actions :install

attribute :version, :kind_of => String, :name_attribute => true
attribute :prefix, :kind_of => String
attribute :arch, :kind_of => String, :default => 'linux-x64'

default_action :install if defined?(default_action)
