action :install do
  converge_by("Install node #{new_resource.version} in #{new_resource.prefix}") do
    archive_dir  = "node-#{new_resource.version}-#{new_resource.arch}"
    archive_file = "#{archive_dir}.tar.gz"

    remote_file "#{Chef::Config[:file_cache_path]}/#{archive_file}" do
      source "http://nodejs.org/dist/#{new_resource.version}/#{archive_file}"
      not_if { ::File.exists?("#{new_resource.prefix}/bin/node") }
    end

    bash "Install node version #{new_resource.version}" do
      cwd Chef::Config[:file_cache_path]
      code <<-EOH
      tar xvf #{archive_file}
      mv #{archive_dir} #{new_resource.prefix}
      EOH
      not_if { ::File.exists?("#{new_resource.prefix}/bin/node") }
    end
  end
end

def whyrun_supported?
  true
end
