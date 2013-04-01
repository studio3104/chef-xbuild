actions :install

attribute :version, :kind_of => String
attribute :prefix, :kind_of => String

def initialize(*args)
  super
  @action = :install
end
