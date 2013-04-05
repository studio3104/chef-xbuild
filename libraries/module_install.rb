class Chef::Mixin::Xbuild
  module ModuleInstall
    def install_gems(module_name, options, ruby_root)
      bash "gem install #{module_name}" do
        code "#{ruby_root}/bin/gem install #{options} #{module_name}"
        not_if { system("#{ruby_root}/bin/gem list #{module_name} -i") }
      end
    end

    def install_cpan_module(module_name, options, perl_root)
      bash "cpanm #{module_name}" do
        code "#{perl_root}/bin/perl #{node['perl_build']['fatpack_cpanm']} #{options} #{module_name}"
        not_if { system("#{perl_root}/bin/perl -M#{module_name} -e'1;' 2> /dev/null") }
      end
    end
  end
end
