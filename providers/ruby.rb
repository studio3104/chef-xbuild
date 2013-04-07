include Chef::Mixin::Xbuild::ModuleInstall

action :install do
  converge_by("Install ruby #{new_resource.version} in #{new_resource.prefix}") do
    bash "Install ruby version #{new_resource.version}" do
      code "#{node['ruby_build']['bin']} #{new_resource.version} #{new_resource.prefix}"
      not_if { ::File.exists?("#{new_resource.prefix}/bin/ruby") }
    end

    %w{ bundler pry }.each do |gem|
      install_gems(gem, '--no-rdoc --no-ri', "#{new_resource.prefix}")
    end
  end
end

def whyrun_supported?
  true
end
