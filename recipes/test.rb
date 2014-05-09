%w{
  Acme::AjiFry
  Proclet
}.each do |module_name|
  xbuild_cpanm module_name do
    options '--force --verbose'
    perl_root node['perl']['prefix']
  end
end

%w{
  ec2ssh
  serverspec
}.each do |module_name|
  xbuild_gem module_name do
    options '--no-rdoc --no-ri'
    ruby_root node['ruby']['prefix']
  end
end
