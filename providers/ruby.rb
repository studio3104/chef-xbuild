require 'chef/mixin/shell_out'
require 'chef/mixin/language'
include Chef::Mixin::ShellOut

action :install do
  @prefix = new_resource.prefix

  bash "Install ruby version #{new_resource.version}" do
    code <<-EOH
    #{node['ruby_build']['bin']} #{new_resource.version} #{new_resource.prefix}
    EOH
    not_if { ::File.exists?("#{new_resource.prefix}/bin/ruby") }
  end

  %w{ bundler pry }.each do |gem|
    install_gems(gem, '--no-rdoc --no-ri')
  end

  if new_resource.gem
    new_resource.gem.each do |mod|
      install_gems(mod, new_resource.gem_option)
    end
  end
end

private

def install_gems(gem, option, prefix = @prefix)
  bash "gem install #{gem}" do
    code "#{prefix}/bin/gem install #{option} #{gem}"
    not_if { system("#{new_resource.prefix}/bin/gem list | grep -q #{gem}") }
  end
end
