include_recipe 'xbuild::default'

if node['perl'] then
  xbuild_perl "install perl #{node['perl']['version']}" do
    version node['perl']['version']
    prefix  node['perl']['prefix']
  end

  node['perl']['modules'].each do |module_name|
    xbuild_cpanm module_name do
      options '--force --verbose'
      perl_root node['perl']['prefix']
    end
  end
end

if node['ruby'] then
  xbuild_ruby "install ruby #{node['ruby']['version']}" do
    version node['ruby']['version']
    prefix  node['ruby']['prefix']
  end

  node['ruby']['gems'].each do |gem_name|
    xbuild_gem gem_name do
      options '--no-rdoc --no-ri'
      ruby_root node['ruby']['prefix']
    end
  end
end

if node['php'] then
  xbuild_php "install php #{node['php']['version']}" do
    version node['php']['version']
    options node['php']['options']
    prefix  node['php']['prefix']
  end
end

if node['python'] then
  xbuild_python "install python #{node['python']['version']}" do
    version node['python']['version']
    prefix  node['python']['prefix']
  end
end

if node['node'] then
  xbuild_node "install node #{node['node']['version']}" do
    version node['node']['version']
    prefix  node['node']['prefix']
  end
end
