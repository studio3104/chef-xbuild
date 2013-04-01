require 'chef/mixin/shell_out'
require 'chef/mixin/language'
include Chef::Mixin::ShellOut

action :install do
#  new_resource.version()

  bash "Install perl version #{new_resource.version}" do
    code <<-EOH
    #{node['perl_build']['bin']} #{new_resource.version} #{new_resource.prefix}
    EOH
    notifies :run, 'bash[Install cpanm and Carton]'
    not_if { ::File.exists?("#{new_resource.prefix}/bin/perl") }
  end

  bash "Install cpanm and Carton" do
    action :nothing
    code <<-EOH
    #{new_resource.prefix}/bin/perl #{node['perl_build']['fatpack_cpanm']} --notest App::cpanminus Carton App::pmuninstall
    EOH
  end
end
