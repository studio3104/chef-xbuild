include_recipe 'git'
include_recipe 'build-essential'

case node[:platform]
when "redhat", "centos"
  package "openssl-devel"
  package "zlib-devel"
  package "readline-devel"
when "ubuntu", "debian"
  package "build-essential"
  package "openssl"
  package "libssl-dev"
  package "libreadline-dev"
end

directory node['xbuild']['path']

git "#{Chef::Config[:file_cache_path]}/ruby-build" do
  repository 'git://github.com/sstephenson/ruby-build.git'
  reference 'master'
  action :checkout
  notifies :run, 'bash[install ruby-build]', :immediately
  not_if { ::File.exists?(node['ruby_build']['bin']) }
end
bash 'install ruby-build' do
  action :nothing
  cwd "#{Chef::Config[:file_cache_path]}/ruby-build"
  environment('PREFIX' => node['xbuild']['path'])
  code <<-EOH
    ./install.sh
  EOH
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
