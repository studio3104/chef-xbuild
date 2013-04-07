node['xbuild']['include_recipes'].each do |r|
  include_recipe r
end

node['xbuild']['depends'].each do |p|
  package p
end

directory node['xbuild']['path']

git "#{Chef::Config[:file_cache_path]}/ruby-build" do
  repository 'git://github.com/sstephenson/ruby-build.git'
  reference 'master'
  action :checkout
  not_if { ::File.exists?(node['ruby_build']['bin']) }
end
bash 'install ruby-build' do
  cwd "#{Chef::Config[:file_cache_path]}/ruby-build"
  environment('PREFIX' => node['xbuild']['path'])
  code <<-EOH
    ./install.sh
  EOH
  not_if { ::File.exists?(node['ruby_build']['bin']) }
end

git "#{Chef::Config[:file_cache_path]}/php-build" do
  repository 'git://github.com/CHH/php-build.git'
  reference 'master'
  action :checkout
  not_if { ::File.exists?(node['php_build']['bin']) }
end
bash 'install php-build' do
  cwd "#{Chef::Config[:file_cache_path]}/php-build"
  environment('PREFIX' => node['xbuild']['path'])
  code <<-EOH
    ./install.sh
  EOH
  not_if { ::File.exists?(node['php_build']['bin']) }
end

git "#{Chef::Config[:file_cache_path]}/pyenv-repo" do
  repository 'git://github.com/yyuu/pyenv.git'
  reference 'master'
  action :checkout
  not_if { ::File.exists?(node['python_build']['bin']) }
end
bash 'install python-build' do
  cwd "#{Chef::Config[:file_cache_path]}/pyenv-repo/plugins/python-build"
  environment('PREFIX' => node['xbuild']['path'])
  code <<-EOH
    ./install.sh
  EOH
  not_if { ::File.exists?(node['python_build']['bin']) }
end

remote_file node['perl_build']['bin'] do
  source 'https://raw.github.com/tokuhirom/Perl-Build/master/perl-build'
  mode '0755'
  not_if { ::File.exists?(node['perl_build']['bin']) }
end
remote_file node['perl_build']['fatpack_cpanm'] do
  source 'http://cpanmin.us/'
  mode '0755'
  not_if { ::File.exists?(node['perl_build']['fatpack_cpanm']) }
end
