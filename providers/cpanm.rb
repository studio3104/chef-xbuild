include Chef::Mixin::Xbuild::ModuleInstall

action :install do
  install_cpan_module(
    new_resource.module,
    new_resource.options,
    new_resource.perl_root
  )
end

def whyrun_supported?
  true
end
