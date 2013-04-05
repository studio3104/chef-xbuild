actions :install

attribute :module,    :kind_of => String, :name_attribute =>true
attribute :options,   :kind_of => String
attribute :perl_root, :kind_of => String

def initialize(*args)
  super
  @action = :install
end
