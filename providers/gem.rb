include Chef::Mixin::Xbuild::ModuleInstall

action :install do
  converge_by("Install gem module #{new_resource.module} in ruby #{new_resource.ruby_root}") do
    install_gems(
      new_resource.module,
      new_resource.options,
      new_resource.ruby_root
    )
  end
end

def whyrun_supported?
  true
end
