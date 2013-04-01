actions :install

attribute :version, :kind_of => String
attribute :prefix, :kind_of => String
attribute :arch, :kind_of => String, :default => 'linux-x64'

def initialize(*args)
  super
  @action = :install
end
