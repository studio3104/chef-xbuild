require 'chef/mixin/shell_out'
require 'chef/mixin/language'
include Chef::Mixin::ShellOut

action :install do
  archive_dir  = "node-#{new_resource.version}-#{new_resource.arch}"
  archive_file = "#{archive_dir}.tar.gz"

  remote_file "#{Chef::Config[:file_cache_path]}/#{archive_file}" do
    source "http://nodejs.org/dist/#{new_resource.version}/#{archive_file}"
    notifies :run, "bash[Install node version #{new_resource.version}]", :immediately
    not_if { ::File.exists?("#{new_resource.prefix}/bin/node") }
  end

  bash "Install node version #{new_resource.version}" do
    action :nothing
    cwd Chef::Config[:file_cache_path]
    code <<-EOH
    tar xvf #{archive_file}
    mv #{archive_dir} #{new_resource.prefix}
    EOH
  end
end
