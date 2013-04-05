actions :install

attribute :version, :kind_of => String, :name_attribute => true
attribute :prefix, :kind_of => String
attribute :options, :kind_of => String

def initialize(*args)
  super
  @action = :install
end
