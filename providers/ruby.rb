require 'chef/mixin/shell_out'
require 'chef/mixin/language'
include Chef::Mixin::ShellOut

action :install do
#  new_resource.version()

  bash "Install ruby version #{new_resource.version}" do
    code <<-EOH
    #{node['ruby_build']['bin']} #{new_resource.version} #{new_resource.prefix}
    EOH
    notifies :run, 'bash[Install pry and bundler]'
    not_if { ::File.exists?("#{new_resource.prefix}/bin/ruby") }
  end

  bash "Install pry and bundler" do
    action :nothing
    code <<-EOH
    #{new_resource.prefix}/bin/gem install --no-rdoc --no-ri bundler pry
    EOH
  end
end
