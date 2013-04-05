include Chef::Mixin::Xbuild::ModuleInstall

action :install do
  install_gems(
    new_resource.module,
    new_resource.options,
    new_resource.ruby_root
  )
end

def whyrun_supported?
  true
end
