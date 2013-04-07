action :install do
  converge_by("Install python #{new_resource.version} in #{new_resource.prefix}") do
    bash "Install python version #{new_resource.version}" do
      code "#{node['python_build']['bin']} #{new_resource.version} #{new_resource.prefix}"
      not_if { ::File.exists?("#{new_resource.prefix}/bin/python") }
    end
  end
end

def whyrun_supported?
  true
end
