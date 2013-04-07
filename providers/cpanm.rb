include Chef::Mixin::Xbuild::ModuleInstall

action :install do
  converge_by("Install cpan module #{new_resource.module} in perl #{new_resource.perl_root}") do
    install_cpan_module(
      new_resource.module,
      new_resource.options,
      new_resource.perl_root
    )
  end
end

def whyrun_supported?
  true
end
