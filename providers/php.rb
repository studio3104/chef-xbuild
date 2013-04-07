action :install do
  converge_by("Install php #{new_resource.version} in #{new_resource.prefix}") do
    bash "Install php version #{new_resource.version}" do
      code "#{node['php_build']['bin']} #{new_resource.version} #{new_resource.prefix} -- #{new_resource.options}"
      not_if { ::File.exists?("#{new_resource.prefix}/bin/php") }
    end
  end
end

def whyrun_supported?
  true
end
