actions :install

attribute :version, :kind_of => String, :name_attribute => true
attribute :prefix, :kind_of => String
attribute :gem, :kind_of => Array
attribute :gem_option, :kind_of => String

def initialize(*args)
  super
  @action = :install
end
