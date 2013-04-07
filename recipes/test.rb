xbuild_perl "install test perl #{node['perl']['version']}" do
  version node['perl']['version']
  prefix  node['perl']['prefix']
end

xbuild_ruby "install test ruby #{node['ruby']['version']}" do
  version node['ruby']['version']
  prefix  node['ruby']['prefix']
end

xbuild_php "install test php #{node['php']['version']}" do
  version node['php']['version']
  options node['php']['options']
  prefix  node['php']['prefix']
end

xbuild_python "install test python #{node['python']['version']}" do
  version node['python']['version']
  prefix  node['python']['prefix']
end

xbuild_node "install test node #{node['node']['version']}" do
  version node['node']['version']
  prefix  node['node']['prefix']
end

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
