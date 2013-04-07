include Chef::Mixin::Xbuild::ModuleInstall

action :install do
  converge_by("Install perl #{new_resource.version} in #{new_resource.prefix}") do
    bash "Install perl version #{new_resource.version}" do
      code "#{node['perl_build']['bin']} #{new_resource.version} #{new_resource.prefix}"
      not_if { ::File.exists?("#{new_resource.prefix}/bin/perl") }
    end

    %w{ App::cpanminus Carton App::pmuninstall }.each do |module_name|
      install_cpan_module(module_name, '--notest', new_resource.prefix)
    end
  end
end

def whyrun_supported?
  true
end
