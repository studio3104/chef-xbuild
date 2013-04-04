require 'chef/mixin/shell_out'
require 'chef/mixin/language'
include Chef::Mixin::ShellOut

action :install do
  @prefix = new_resource.prefix
  @cpanm  = node['perl_build']['fatpack_cpanm']

  bash "Install perl version #{new_resource.version}" do
    code <<-EOH
    #{node['perl_build']['bin']} #{new_resource.version} #{new_resource.prefix}
    EOH
    not_if { ::File.exists?("#{new_resource.prefix}/bin/perl") }
  end

  %w{ App::cpanminus Carton App::pmuninstall }.each do |mod|
    install_cpan_module(mod, '--notest')
  end

  if new_resource.cpan
    new_resource.cpan.each do |mod|
      install_cpan_module(mod, new_resource.cpanm_option)
    end
  end
end

private

def install_cpan_module(mod, option, prefix = @prefix, cpanm = @cpanm)
  bash "cpanm #{mod}" do
    code "#{prefix}/bin/perl #{cpanm} #{option} #{mod}"
    not_if { system("#{prefix}/bin/perl -M#{mod} -e'1;' 2> /dev/null") }
  end
end
